import 'package:masiro/data/model/volume.dart';
import 'package:masiro/data/network/volume_response.dart';

List<Volume> volumeResponseToVolumeList(
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
