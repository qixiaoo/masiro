import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';
import 'package:masiro/data/model/chapter_detail.dart';
import 'package:masiro/data/model/novel.dart';
import 'package:masiro/data/model/novel_detail.dart';
import 'package:masiro/data/model/volume.dart';
import 'package:masiro/data/network/chapter_detail_response.dart';
import 'package:masiro/data/network/masiro_api.dart';
import 'package:masiro/data/network/novel_collection_response.dart';
import 'package:masiro/data/network/novel_detail_response.dart';
import 'package:masiro/data/network/volume_response.dart';

// TODO(qixiao): Create error handlers or interceptors to globally handle errors.

@lazySingleton
class MasiroRepository {
  Future<List<Novel>> getFavorites() async {
    final firstPage = await MasiroApi.getPagedNovelCollection(page: 1);
    final total = firstPage.pages;
    if (total == 1) {
      return firstPage.novels.map(_novelResponseToNovel).toList();
    }

    // Fetch all pages if the total number is more than one.
    final List<Novel> allNovels = [];
    for (var number = 2; number <= total; number++) {
      final nextPage = await MasiroApi.getPagedNovelCollection(page: number);
      allNovels.addAll(nextPage.novels.map(_novelResponseToNovel));
    }

    return allNovels;
  }

  Future<NovelDetail> getNovelDetail(int novelId) async {
    final response = await MasiroApi.getNovelDetail(novelId);
    return _novelDetailResponseToNovelDetail(response);
  }

  Future<ChapterDetail> getChapterDetail(int novelId, int chapterId) async {
    final response = await MasiroApi.getChapterDetail(novelId, chapterId);
    return _chapterDetailResponseToChapterDetail(response);
  }
}

Novel _novelResponseToNovel(NovelResponse n) {
  return Novel(
    id: n.id,
    title: n.title,
    brief: n.brief,
    rank: n.rank,
    coverImg: n.coverImg,
    author: n.author,
    lastUpdated: n.newUpContent,
    lastUpdatedTime: n.newUpTime,
  );
}

NovelDetail _novelDetailResponseToNovelDetail(NovelDetailResponse d) {
  final header = NovelDetailHeader(
    title: d.header.title,
    author: d.header.author,
    translators: d.header.translators,
    status: d.header.status,
    originalBook: d.header.originalBook,
    brief: d.header.brief,
    isFavorite: d.header.isFavorite,
    csrfToken: d.header.csrfToken,
    coverImg: d.header.coverImg,
  );
  final volumes = _volumeResponseToVolumeList(d.volumes, d.chapters);
  return NovelDetail(volumes: volumes, header: header);
}

List<Volume> _volumeResponseToVolumeList(
  List<VolumeResponse> volumes,
  List<ChapterResponse> chapters,
) {
  final chapterModels = chapters.map(
    (c) => Chapter(
      id: c.id,
      novelId: c.novelId,
      volumeId: c.parentId,
      title: c.title,
      limitLv: c.limitLv,
      cost: c.cost,
      createdTime: c.episodeCreateTime,
      updatedTime: c.episodeUpdateTime,
    ),
  );
  final volumeModels = volumes.map((v) {
    final chapterList = chapterModels.where((c) => c.volumeId == v.id).toList();
    return Volume(id: v.id, title: v.title, chapters: chapterList);
  }).toList();
  return volumeModels;
}

ChapterDetail _chapterDetailResponseToChapterDetail(ChapterDetailResponse d) {
  final volumes = _volumeResponseToVolumeList(d.volumes, d.chapters);
  final chapterContent = _htmlToChapterContent(d.rawHtml);
  return ChapterDetail(
    title: d.title,
    content: chapterContent,
    textContent: d.textContent,
    csrfToken: d.csrfToken,
    volumes: volumes,
  );
}

ChapterContent _htmlToChapterContent(String html) {
  final document = parse(html);
  final contentNode = document.querySelector('.nvl-content');
  final List<ChapterContentElement> elements = [];

  // Extract all text and images from the `contentNode`
  for (final node in contentNode?.nodes ?? []) {
    // Ignore blank text nodes that are children of `contentNode`
    if (node.nodeType == Node.TEXT_NODE &&
        (node.text?.trim().isEmpty ?? true)) {
      continue;
    }

    // Extract text from a text node child
    if (node.nodeType == Node.TEXT_NODE) {
      final text = node.text ?? '';
      elements.add(TextContent(text: text));
      continue;
    }

    // Extract image from an image node child
    if (node.nodeType == Node.ELEMENT_NODE &&
        (node as Element).localName == 'img') {
      final src = node.attributes['src'] ?? '';
      elements.add(ImageContent(src: src));
      continue;
    }

    // For non-text and non-image element nodes, traverse the node to extract its text and images
    if (node.nodeType == Node.ELEMENT_NODE &&
        (node as Element).localName != 'img') {
      final List<ChapterContentElement> elementsOfNode = [];
      _traverseNodeToExtractContent(node, elementsOfNode);
      elements.addAll(elementsOfNode);
    }
  }

  return ChapterContent(elements: elements);
}

/// Recursively traverses the given [node] to extract all text and image content.
/// Text nodes are combined with the previous text node if it exists to form a single `TextContent`.
/// Image nodes are extracted as `ImageContent`.
/// The extracted content is added to [contentElementList].
///
/// Example:
/// ```
/// input: '<p>he<span>llo</span> <img src="123"> <span>world</span></p>'
/// output: [TextContent(text: 'hello '), ImageContent(src: '123'), TextContent(text: ' world')]
/// ```
///
/// Parameters:
/// - [node]: The root node from which the content extraction begins.
/// - [contentElementList]: A list that will store the extracted `ChapterContentElement` objects.
void _traverseNodeToExtractContent(
  Node node,
  List<ChapterContentElement> contentElementList,
) {
  if (node.nodeType == Node.TEXT_NODE) {
    final text = node.text ?? '';
    if (contentElementList.isNotEmpty &&
        contentElementList.last is TextContent) {
      final last = contentElementList.removeLast() as TextContent;
      contentElementList.add(last.copyWith(text: last.text + text));
    } else {
      contentElementList.add(TextContent(text: text));
    }
    return;
  }

  if (node.nodeType == Node.ELEMENT_NODE &&
      (node as Element).localName == 'img') {
    final src = node.attributes['src'] ?? '';
    contentElementList.add(ImageContent(src: src));
    return;
  }

  for (final e in node.nodes) {
    _traverseNodeToExtractContent(e, contentElementList);
  }
}
