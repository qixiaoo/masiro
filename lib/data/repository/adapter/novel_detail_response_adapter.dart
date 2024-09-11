import 'package:masiro/data/model/novel_detail.dart';
import 'package:masiro/data/network/response/novel_detail_response.dart';
import 'package:masiro/data/repository/adapter/volume_response_adapter.dart';

NovelDetail novelDetailResponseToNovelDetail(NovelDetailResponse d) {
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
  final volumes = volumeResponseToVolumeList(d.volumes, d.chapters);
  return NovelDetail(
    volumes: volumes,
    header: header,
    lastReadChapterId: d.lastReadChapterId,
  );
}
