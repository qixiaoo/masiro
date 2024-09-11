import 'package:isar/isar.dart';
import 'package:masiro/data/repository/model/reading_mode.dart';

class ChapterRecord {
  Id id;

  int chapterId;
  int novelId;
  int progress;

  ReadingMode readingMode;

  ChapterRecord({
    required this.id,
    required this.chapterId,
    required this.novelId,
    required this.progress,
    required this.readingMode,
  });
}
