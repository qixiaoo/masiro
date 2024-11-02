import 'package:isar/isar.dart';
import 'package:masiro/data/repository/model/read_position.dart';
import 'package:masiro/data/repository/model/reading_mode.dart';

class ChapterRecord {
  Id id;

  int chapterId;
  int novelId;

  ReadingMode readingMode;

  ReadPosition position;

  Id userId;

  ChapterRecord({
    required this.id,
    required this.chapterId,
    required this.novelId,
    required this.readingMode,
    required this.position,
    required this.userId,
  });
}
