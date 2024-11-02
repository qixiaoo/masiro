import 'package:isar/isar.dart';
import 'package:masiro/misc/constant.dart';

part 'chapter_record_entity.g.dart';

@collection
class ChapterRecordEntity {
  Id id;

  @Index()
  int chapterId;

  @Index()
  int novelId;

  @Deprecated('Use `positionJson` instead.')
  int progress;

  @Enumerated(EnumType.name)
  late ChapterReadingMode readingMode;

  String? positionJson;

  @Index()
  int userId;

  ChapterRecordEntity({
    this.id = Isar.autoIncrement,
    required this.chapterId,
    required this.novelId,
    required this.progress,
    required this.readingMode,
    this.positionJson,
    this.userId = defaultUserId,
  });
}

enum ChapterReadingMode {
  page,
  scroll,
}
