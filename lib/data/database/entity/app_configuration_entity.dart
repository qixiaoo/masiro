import 'package:isar/isar.dart';

part 'app_configuration_entity.g.dart';

@collection
class AppConfigurationEntity {
  Id id;

  int dbVersion;

  AppConfigurationEntity({
    this.id = Isar.autoIncrement,
    required this.dbVersion,
  });

  AppConfigurationEntity copyWith({
    Id? id,
    int? dbVersion,
  }) {
    return AppConfigurationEntity(
      id: id ?? this.id,
      dbVersion: dbVersion ?? this.dbVersion,
    );
  }
}
