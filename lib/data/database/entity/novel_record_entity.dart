import 'package:isar/isar.dart';
import 'package:masiro/data/database/entity/chapter_record_entity.dart';

part 'novel_record_entity.g.dart';

@collection
class NovelRecordEntity {
  Id novelId;

  final chapterRecords = IsarLinks<ChapterRecordEntity>();

  NovelRecordEntity({required this.novelId});
}
