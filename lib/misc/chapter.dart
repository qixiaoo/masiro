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

Chapter? getPreviousChapter(List<Volume> volumes, int chapterId) {
  for (var vIndex = 0; vIndex < volumes.length; vIndex++) {
    final v = volumes[vIndex];
    final cIndex = v.chapters.indexWhere((c) => c.id == chapterId);
    if (cIndex != -1) {
      if (cIndex == 0) {
        final prevVolumeIndex = vIndex - 1;
        if (prevVolumeIndex < 0) {
          return null;
        }
        final prevVolume = volumes[prevVolumeIndex];
        return prevVolume.chapters.lastOrNull;
      } else {
        return v.chapters[cIndex - 1];
      }
    }
  }
  return null;
}

Chapter? getNextChapter(List<Volume> volumes, int chapterId) {
  for (var vIndex = 0; vIndex < volumes.length; vIndex++) {
    final v = volumes[vIndex];
    final cIndex = v.chapters.indexWhere((c) => c.id == chapterId);
    if (cIndex != -1) {
      if (cIndex == v.chapters.length - 1) {
        final nextVolumeIndex = vIndex + 1;
        if (nextVolumeIndex >= volumes.length) {
          return null;
        }
        final nextVolume = volumes[nextVolumeIndex];
        return nextVolume.chapters.firstOrNull;
      } else {
        return v.chapters[cIndex + 1];
      }
    }
  }
  return null;
}
