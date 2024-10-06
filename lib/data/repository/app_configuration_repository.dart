import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:masiro/data/database/dao/app_configuration_dao.dart';
import 'package:masiro/data/repository/adapter/app_configuration_entity_adapter.dart';
import 'package:masiro/data/repository/model/app_configuration.dart';
import 'package:masiro/di/get_it.dart';

@lazySingleton
class AppConfigurationRepository {
  final _appConfigurationDao = getIt<AppConfigurationDao>();

  Future<AppConfiguration> getAppConfiguration() async {
    final config = await _appConfigurationDao.getAppConfiguration();
    // Although it's possible that there's no app configuration in the database,
    // we can still assert that the app configuration exists.
    // This is because we insert a default app configuration if it's null when the app starts,
    // see the function `performMigrationIfNeeded`.
    return appConfigurationEntityToModel(config!);
  }

  Future<Id> putAppConfiguration(
    AppConfiguration appConfiguration,
  ) async {
    final entity = appConfigurationToEntity(appConfiguration);
    return _appConfigurationDao.putAppConfiguration(entity);
  }

  Future<Id> clearUserData() async {
    final config = await getAppConfiguration();
    final nextConfig = config.copyWith(lastSignInTime: 0);
    return putAppConfiguration(nextConfig);
  }
}
