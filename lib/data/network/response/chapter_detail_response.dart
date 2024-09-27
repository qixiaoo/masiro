import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:masiro/data/network/response/volume_response.dart';

class ChapterDetailResponse {
  int chapterId;
  String title;
  String textContent;
  String csrfToken;
  List<VolumeResponse> volumes;
  List<ChapterResponse> chapters;
  String rawHtml;

  PaymentInfoResponse? paymentInfo;

  ChapterDetailResponse({
    required this.chapterId,
    required this.title,
    required this.textContent,
    required this.csrfToken,
    required this.volumes,
    required this.chapters,
    required this.rawHtml,
    required this.paymentInfo,
  });

  factory ChapterDetailResponse.fromHtml(String html) {
    final document = parse(html);
    final querySelector = document.querySelector;
    final querySelectorAll = document.querySelectorAll;
    final chapterId = querySelector('#chapter_id')?.attributes['value'] ?? '0';
    final title = querySelector('.novel-title')?.text.trim();
    final textContent = querySelector('.nvl-content')?.text.trim() ?? '';
    final csrfToken = querySelector('input.csrf')?.attributes['value'] ?? '';
    final volumesJson = document.getElementById('f-chapters-json')?.text;
    final List<VolumeResponse> volumes =
        volumesJson != null ? volumeResponseFromJson(volumesJson) : [];
    final chaptersJson = document.getElementById('chapters-json')?.text;
    final List<ChapterResponse> chapters =
        chaptersJson != null ? chapterResponseFromJson(chaptersJson) : [];

    final didPay = querySelector('p.pay') == null;
    final paymentInfo =
        didPay ? null : PaymentInfoResponse.fromDocument(document);
    final titleHint = querySelectorAll('div.hint p a').lastOrNull?.text;

    return ChapterDetailResponse(
      chapterId: int.parse(chapterId),
      title: title ?? titleHint ?? '',
      textContent: textContent,
      csrfToken: csrfToken,
      volumes: volumes,
      chapters: chapters,
      rawHtml: html,
      paymentInfo: paymentInfo,
    );
  }
}

class PaymentInfoResponse {
  int cost;
  int type;
  int chapterId;

  PaymentInfoResponse({
    required this.cost,
    required this.type,
    required this.chapterId,
  });

  factory PaymentInfoResponse.fromDocument(Document document) {
    final querySelector = document.querySelector;
    final cost = querySelector('input.cost')?.attributes['value'] ?? '0';
    final type = querySelector('input.type')?.attributes['value'] ?? '0';
    final objectId =
        querySelector('input.object_id')?.attributes['value'] ?? '0';
    return PaymentInfoResponse(
      cost: int.parse(cost),
      type: int.parse(type),
      chapterId: int.parse(objectId),
    );
  }
}
