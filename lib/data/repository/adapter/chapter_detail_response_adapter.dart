import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:masiro/data/model/chapter_detail.dart';
import 'package:masiro/data/network/response/chapter_detail_response.dart';
import 'package:masiro/data/repository/adapter/volume_response_adapter.dart';

ChapterDetail chapterDetailResponseToChapterDetail(ChapterDetailResponse d) {
  final volumes = volumeResponseToVolumeList(d.volumes, d.chapters);
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
