import 'dart:io';

import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:masiro/data/database/dao/chapter_record_dao.dart';
import 'package:masiro/data/database/dao/user_dao.dart';
import 'package:masiro/data/database/entity/current_cookie_entity.dart';
import 'package:masiro/data/database/entity/user_entity.dart';
import 'package:masiro/data/database/migration/migration.dart';
import 'package:masiro/data/repository/profile_repository.dart';
import 'package:masiro/di/get_it.dart';
import 'package:masiro/misc/constant.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

final migration1To2 = Migration(
  startVersion: 1,
  endVersion: 2,
  migrate: (Isar isar) async {
    final logger = getIt<Logger>();
    final userDao = getIt<UserDao>();
    final chapterRecordDao = getIt<ChapterRecordDao>();
    final profileRepository = getIt<ProfileRepository>();

    final appDir = await getApplicationSupportDirectory();
    final cookieDir = Directory(join(appDir.path, 'ie0_ps1'));
    final isValidDir = await cookieDir.exists();

    if (!isValidDir) {
      return;
    }

    final cookieFiles = cookieDir.list();
    final cookieList = <KeyValuePair>[];
    await for (final entity in cookieFiles) {
      if (entity is! File) {
        continue;
      }
      final key = basename(entity.path);
      final value = await entity.readAsString();
      cookieList.add(keyValuePair(key, value));
    }

    if (cookieList.isEmpty) {
      return;
    }

    final currentCookie = CurrentCookieEntity(
      userId: defaultUserId,
      cookieList: cookieList,
    );
    await userDao.putCurrentCookie(currentCookie);
    logger.d('The local cookies have been moved into the database.');

    final profile = await profileRepository.refreshProfile();
    final userId = profile.id;
    final userName = profile.name;
    logger.d('The current cookies belong to user $userId - $userName');

    final currentUser = await userDao.getUser(userId) ??
        UserEntity(
          userId: userId,
          userName: userName,
        );
    await userDao.putUser(currentUser.copyWith(cookieList: cookieList));
    await userDao.putCurrentCookie(currentCookie.copyWith(userId: userId));
    logger.d('The current user information has been saved to the database.');

    final chapterRecords = await chapterRecordDao.getAllChapterRecords();
    for (final record in chapterRecords) {
      record.userId = userId;
    }
    await chapterRecordDao.putAllChapterRecords(chapterRecords);
    logger.d(
      'The current user id has been assigned to all chapter history records.',
    );
  },
);
