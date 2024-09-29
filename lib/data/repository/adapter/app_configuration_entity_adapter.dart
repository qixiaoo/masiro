import 'package:masiro/data/database/entity/app_configuration_entity.dart';
import 'package:masiro/data/repository/model/app_configuration.dart';

AppConfiguration appConfigurationEntityToModel(AppConfigurationEntity entity) {
  return AppConfiguration(
    id: entity.id,
    dbVersion: entity.dbVersion,
    lastSignInTime: entity.lastSignInTime,
  );
}

AppConfigurationEntity appConfigurationToEntity(AppConfiguration config) {
  return AppConfigurationEntity(
    id: config.id,
    dbVersion: config.dbVersion,
    lastSignInTime: config.lastSignInTime,
  );
}
