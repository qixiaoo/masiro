import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:masiro/data/database/core.dart';
import 'package:masiro/data/database/dao/app_configuration_dao.dart';
import 'package:masiro/data/database/entity/app_configuration_entity.dart';
import 'package:masiro/di/get_it.dart';

/// Perform manual data migration.
/// This function should be called after `get_it` has been set up.
Future<void> performMigrationIfNeeded() async {
  final logger = getIt<Logger>();
  final isar = getIt<Isar>();
  final configurationDao = getIt<AppConfigurationDao>();
  final config = await configurationDao.getAppConfiguration();

  // If the app configuration is null, it means either the user is using the app for the first time,
  // or the user has upgraded the app from an earlier pre-release version.
  // In both cases, we can simply clear the database and insert a new app configuration into it.
  if (config == null) {
    await _initializeAppConfiguration(logger, isar, configurationDao);
    return;
  }

  final sourceVersion = config.dbVersion;
  const targetVersion = dbCurrentVersion;

  // Skip migration if the `sourceVersion` is equal or newer than the `targetVersion`
  if (sourceVersion >= targetVersion) {
    return;
  }

  final migrationList = migrations.where(
    (m) => m.startVersion >= sourceVersion && m.endVersion <= targetVersion,
  );
  for (final migration in migrationList) {
    await migration.migrate(isar);
  }

  // Update the `dbVersion` after migration is done
  await configurationDao.updateDbVersion(dbCurrentVersion);
}

Future<void> _initializeAppConfiguration(
  Logger logger,
  Isar isar,
  AppConfigurationDao configurationDao,
) async {
  logger.d('No app configuration found. Initializing...');
  await clearDatabase(isar);
  await configurationDao.putAppConfiguration(
    AppConfigurationEntity(dbVersion: dbCurrentVersion),
  );
  logger.d('App configuration initialization completed.');
}

/// A series of migration operations that should be executed sequentially.
///
/// Note:
/// It is essential to maintain the order of the migration operation items
/// to ensure that the data in the database is transformed correctly.
List<Migration> migrations = [];

class Migration {
  int startVersion;
  int endVersion;
  Future<void> Function(Isar isar) migrate;

  Migration({
    required this.startVersion,
    required this.endVersion,
    required this.migrate,
  });
}
