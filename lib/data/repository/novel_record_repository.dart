import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:masiro/data/database/dao/chapter_record_dao.dart';
import 'package:masiro/data/repository/adapter/chapter_record_entity_adapter.dart';
import 'package:masiro/data/repository/model/chapter_record.dart';
import 'package:masiro/data/repository/model/reading_mode.dart';
import 'package:masiro/di/get_it.dart';

@injectable
class NovelRecordRepository {
  final _chapterRecordDao = getIt<ChapterRecordDao>();

  Future<ChapterRecord?> getChapterRecord(Id recordId) async {
    final recordEntity = await _chapterRecordDao.getChapterRecord(recordId);
    return recordEntity != null ? chapterRecordToModel(recordEntity) : null;
  }

  Future<Id> putChapterRecord(ChapterRecord record) async {
    final recordEntity = chapterRecordToEntity(record);
    return _chapterRecordDao.putChapterRecord(recordEntity);
  }

  Future<ChapterRecord?> findChapterRecord(
    int userId,
    int chapterId,
    ReadingMode readingMode,
  ) async {
    final recordEntity = await _chapterRecordDao.findChapterRecord(
      userId,
      chapterId,
      readingModeToEntity(readingMode),
    );
    return recordEntity != null ? chapterRecordToModel(recordEntity) : null;
  }
}
