import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:masiro/data/database/entity/app_configuration_entity.dart';

@lazySingleton
class AppConfigurationDao {
  final Isar _isar;

  AppConfigurationDao({required Isar isar}) : _isar = isar;

  Future<AppConfigurationEntity?> getAppConfiguration() async {
    return _isar.appConfigurationEntitys.where().limit(1).findFirst();
  }

  Future<Id> putAppConfiguration(
    AppConfigurationEntity appConfiguration,
  ) async {
    final configuration = await getAppConfiguration();
    return _isar.writeTxn(() async {
      return _isar.appConfigurationEntitys.put(
        appConfiguration.copyWith(
          id: configuration?.id ?? appConfiguration.id,
        ),
      );
    });
  }

  Future<Id> updateDbVersion(int dbVersion) async {
    final configuration = await getAppConfiguration();
    if (configuration == null) {
      throw Exception('''There is no app configuration to update.''');
    }

    return _isar.writeTxn(() async {
      return _isar.appConfigurationEntitys.put(
        configuration.copyWith(dbVersion: dbVersion),
      );
    });
  }
}
