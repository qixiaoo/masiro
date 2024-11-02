import 'package:isar/isar.dart';
import 'package:masiro/data/database/entity/app_configuration_entity.dart';
import 'package:masiro/data/database/entity/chapter_record_entity.dart';
import 'package:masiro/data/database/entity/current_cookie_entity.dart';
import 'package:masiro/data/database/entity/novel_record_entity.dart';
import 'package:masiro/data/database/entity/user_entity.dart';

const dbCurrentVersion = 2;

List<CollectionSchema<dynamic>> dbSchemas = [
  NovelRecordEntitySchema,
  ChapterRecordEntitySchema,
  AppConfigurationEntitySchema,
  UserEntitySchema,
  CurrentCookieEntitySchema,
];

Future<void> clearDatabase(Isar isar) async {
  return isar.writeTxn(() async {
    await isar.clear();
  });
}
