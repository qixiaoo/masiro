import 'package:html/parser.dart';
import 'package:masiro/data/network/response/volume_response.dart';

class ChapterDetailResponse {
  String title;
  String textContent;
  String csrfToken;
  List<VolumeResponse> volumes;
  List<ChapterResponse> chapters;
  String rawHtml;

  ChapterDetailResponse({
    required this.title,
    required this.textContent,
    required this.csrfToken,
    required this.volumes,
    required this.chapters,
    required this.rawHtml,
  });

  factory ChapterDetailResponse.fromHtml(String html) {
    final document = parse(html);
    final querySelector = document.querySelector;
    final title = querySelector('.novel-title')?.text.trim() ?? '';
    final textContent = querySelector('.nvl-content')?.text.trim() ?? '';
    final csrfToken = querySelector('input.csrf')?.attributes['value'] ?? '';
    final volumesJson = document.getElementById('f-chapters-json')?.text;
    final List<VolumeResponse> volumes =
        volumesJson != null ? volumeResponseFromJson(volumesJson) : [];
    final chaptersJson = document.getElementById('chapters-json')?.text;
    final List<ChapterResponse> chapters =
        chaptersJson != null ? chapterResponseFromJson(chaptersJson) : [];
    return ChapterDetailResponse(
      title: title,
      textContent: textContent,
      csrfToken: csrfToken,
      volumes: volumes,
      chapters: chapters,
      rawHtml: html,
    );
  }
}
