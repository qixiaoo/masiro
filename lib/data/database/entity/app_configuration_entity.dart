import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:masiro/misc/constant.dart';

part 'app_configuration_entity.g.dart';

@collection
class AppConfigurationEntity {
  Id id;

  int dbVersion;

  @Deprecated('Use `UserEntity.lastSignInTime` instead.')
  int lastSignInTime;

  @Enumerated(EnumType.name)
  ThemeMode themeMode;

  int themeColor;

  int fontSize;

  AppConfigurationEntity({
    this.id = Isar.autoIncrement,
    required this.dbVersion,
    this.lastSignInTime = 0,
    this.themeMode = ThemeMode.system,
    this.themeColor = defaultThemeColor,
    this.fontSize = defaultFontSize,
  });

  AppConfigurationEntity copyWith({
    Id? id,
    int? dbVersion,
    int? lastSignInTime,
    ThemeMode? themeMode,
    int? themeColor,
    int? fontSize,
  }) {
    return AppConfigurationEntity(
      id: id ?? this.id,
      dbVersion: dbVersion ?? this.dbVersion,
      lastSignInTime: lastSignInTime ?? this.lastSignInTime,
      themeMode: themeMode ?? this.themeMode,
      themeColor: themeColor ?? this.themeColor,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}
