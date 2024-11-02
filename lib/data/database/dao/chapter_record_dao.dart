import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:masiro/data/database/entity/chapter_record_entity.dart';

@injectable
class ChapterRecordDao {
  final Isar _isar;

  ChapterRecordDao({required Isar isar}) : _isar = isar;

  Future<ChapterRecordEntity?> getChapterRecord(Id id) async {
    return _isar.chapterRecordEntitys.get(id);
  }

  Future<Id> putChapterRecord(ChapterRecordEntity chapterRecord) async {
    return _isar.writeTxn(() async {
      return _isar.chapterRecordEntitys.put(chapterRecord);
    });
  }

  Future<ChapterRecordEntity?> findChapterRecord(
    int userId,
    int chapterId,
    ChapterReadingMode readingMode,
  ) async {
    return _isar.chapterRecordEntitys
        .filter()
        .userIdEqualTo(userId)
        .chapterIdEqualTo(chapterId)
        .readingModeEqualTo(readingMode)
        .findFirst();
  }

  Future<List<ChapterRecordEntity>> getAllChapterRecords() async {
    return _isar.chapterRecordEntitys.where().findAll();
  }

  Future<List<Id>> putAllChapterRecords(
    List<ChapterRecordEntity> chapterRecords,
  ) async {
    return _isar.writeTxn(() async {
      return _isar.chapterRecordEntitys.putAll(chapterRecords);
    });
  }

  Future<void> clearChapterRecords() async {
    return _isar.writeTxn(() async {
      return _isar.chapterRecordEntitys.clear();
    });
  }
}
