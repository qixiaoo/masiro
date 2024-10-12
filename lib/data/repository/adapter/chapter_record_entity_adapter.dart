import 'dart:convert';

import 'package:masiro/data/database/entity/chapter_record_entity.dart';
import 'package:masiro/data/repository/model/chapter_record.dart';
import 'package:masiro/data/repository/model/read_position.dart';
import 'package:masiro/data/repository/model/reading_mode.dart';

ChapterRecord chapterRecordToModel(ChapterRecordEntity record) {
  return ChapterRecord(
    id: record.id,
    chapterId: record.chapterId,
    novelId: record.novelId,
    readingMode: readingModeToModel(record.readingMode),
    position: jsonToPosition(record.positionJson),
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

ReadPosition jsonToPosition(String? positionJson) {
  if (positionJson == null) {
    return startPosition;
  }
  final position = json.decode(positionJson);
  return ReadPosition(
    elementIndex: position['elementIndex'],
    elementTopOffset: position['elementTopOffset'],
    elementCharacterIndex: position['elementCharacterIndex'],
    articleCharacterIndex: position['articleCharacterIndex'],
  );
}

ChapterRecordEntity chapterRecordToEntity(ChapterRecord record) {
  return ChapterRecordEntity(
    id: record.id,
    chapterId: record.chapterId,
    novelId: record.novelId,
    progress: 0,
    readingMode: readingModeToEntity(record.readingMode),
    positionJson: positionToJson(record.position),
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

String positionToJson(ReadPosition position) {
  return json.encode({
    'elementIndex': position.elementIndex,
    'elementTopOffset': position.elementTopOffset,
    'elementCharacterIndex': position.elementCharacterIndex,
    'articleCharacterIndex': position.articleCharacterIndex,
  });
}
