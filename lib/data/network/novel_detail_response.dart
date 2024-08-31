import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:masiro/data/network/volume_response.dart';

class NovelDetailResponse {
  List<VolumeResponse> volumes;
  List<ChapterResponse> chapters;
  NovelDetailHeaderResponse header;

  NovelDetailResponse({
    required this.volumes,
    required this.chapters,
    required this.header,
  });

  factory NovelDetailResponse.fromHtml(String html) {
    final document = parse(html);
    final volumesJson = document.getElementById('f-chapters-json')?.text;
    final List<VolumeResponse> volumes =
        volumesJson != null ? volumeResponseFromJson(volumesJson) : [];
    final chaptersJson = document.getElementById('chapters-json')?.text;
    final List<ChapterResponse> chapters =
        chaptersJson != null ? chapterResponseFromJson(chaptersJson) : [];
    final header = NovelDetailHeaderResponse.fromDocument(document);
    return NovelDetailResponse(
      volumes: volumes,
      chapters: chapters,
      header: header,
    );
  }
}

class NovelDetailHeaderResponse {
  String title;
  String author;
  List<String> translators;
  String status;
  String originalBook;
  String brief;
  bool isFavorite;
  String csrfToken;
  String coverImg;

  NovelDetailHeaderResponse({
    required this.title,
    required this.author,
    required this.translators,
    required this.status,
    required this.originalBook,
    required this.brief,
    required this.isFavorite,
    required this.csrfToken,
    required this.coverImg,
  });

  factory NovelDetailHeaderResponse.fromDocument(Document document) {
    final querySelector = document.querySelector;
    final querySelectorAll = document.querySelectorAll;
    final title = querySelector('.novel-title')?.text.trim() ?? '';
    final author = querySelector('.author a')?.text.trim() ?? '';
    final translators =
        querySelectorAll('.n-translator a').map((e) => e.text.trim()).toList();
    final status = querySelector('.n-status')?.text.split(':')[1].trim() ?? '';
    final originalBook =
        querySelector('.n-ori')?.text.trim().substring(5) ?? '';
    final brief = querySelector('.brief')?.text.trim() ?? '';
    final isFavorite = querySelector('.btn-collect')
            ?.attributes
            .containsValue('display: none;') ??
        false;
    final csrfToken = querySelector('input.csrf')?.attributes['value'] ?? '';
    final coverImg =
        querySelector('.img-thumbnail')?.attributes['data-src'] ?? '';
    return NovelDetailHeaderResponse(
      title: title,
      author: author,
      translators: translators,
      status: status,
      originalBook: originalBook,
      brief: brief,
      isFavorite: isFavorite,
      csrfToken: csrfToken,
      coverImg: coverImg,
    );
  }
}
