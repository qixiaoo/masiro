import 'package:isar/isar.dart';

part 'chapter_record_entity.g.dart';

@collection
class ChapterRecordEntity {
  Id id;

  @Index()
  int chapterId;

  @Index()
  int novelId;

  int progress;

  @Enumerated(EnumType.name)
  late ChapterReadingMode readingMode;

  ChapterRecordEntity({
    this.id = Isar.autoIncrement,
    required this.chapterId,
    required this.novelId,
    required this.progress,
    required this.readingMode,
  });
}

enum ChapterReadingMode {
  page,
  scroll,
}
