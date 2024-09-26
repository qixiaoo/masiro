import 'package:masiro/data/repository/model/volume.dart';

Chapter? getChapterFromVolumes(List<Volume> volumes, int chapterId) {
  for (final v in volumes) {
    final index = v.chapters.indexWhere((c) => c.id == chapterId);
    if (index != -1) {
      return v.chapters[index];
    }
  }
  return null;
}
