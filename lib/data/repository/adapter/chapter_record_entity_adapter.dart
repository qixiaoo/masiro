import 'package:masiro/data/database/entity/chapter_record_entity.dart';
import 'package:masiro/data/model/chapter_record.dart';
import 'package:masiro/data/model/reading_mode.dart';

ChapterRecord chapterRecordToModel(ChapterRecordEntity record) {
  return ChapterRecord(
    id: record.id,
    chapterId: record.chapterId,
    novelId: record.novelId,
    progress: record.progress,
    readingMode: readingModeToModel(record.readingMode),
  );
}

ReadingMode readingModeToModel(ChapterReadingMode mode) {
  switch (mode) {
    case ChapterReadingMode.page:
      return ReadingMode.page;
    case ChapterReadingMode.scroll:
      return ReadingMode.scroll;
  }
}

ChapterRecordEntity chapterRecordToEntity(ChapterRecord record) {
  return ChapterRecordEntity(
    id: record.id,
    chapterId: record.chapterId,
    novelId: record.novelId,
    progress: record.progress,
    readingMode: readingModeToEntity(record.readingMode),
  );
}

ChapterReadingMode readingModeToEntity(ReadingMode mode) {
  switch (mode) {
    case ReadingMode.page:
      return ChapterReadingMode.page;
    case ReadingMode.scroll:
      return ChapterReadingMode.scroll;
  }
}
