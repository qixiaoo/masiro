import 'package:isar/isar.dart';

part 'app_configuration_entity.g.dart';

@collection
class AppConfigurationEntity {
  Id id;

  int dbVersion;

  int lastSignInTime;

  AppConfigurationEntity({
    this.id = Isar.autoIncrement,
    required this.dbVersion,
    this.lastSignInTime = 0,
  });

  AppConfigurationEntity copyWith({
    Id? id,
    int? dbVersion,
    int? lastSignInTime,
  }) {
    return AppConfigurationEntity(
      id: id ?? this.id,
      dbVersion: dbVersion ?? this.dbVersion,
      lastSignInTime: lastSignInTime ?? this.lastSignInTime,
    );
  }
}
