import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class AppConfiguration extends Equatable {
  final Id id;
  final int dbVersion;
  final ThemeMode themeMode;
  final int themeColor;
  final int fontSize;

  const AppConfiguration({
    required this.id,
    required this.dbVersion,
    required this.themeMode,
    required this.themeColor,
    required this.fontSize,
  });

  AppConfiguration copyWith({
    Id? id,
    int? dbVersion,
    int? lastSignInTime,
    ThemeMode? themeMode,
    int? themeColor,
    int? fontSize,
  }) {
    return AppConfiguration(
      id: id ?? this.id,
      dbVersion: dbVersion ?? this.dbVersion,
      themeMode: themeMode ?? this.themeMode,
      themeColor: themeColor ?? this.themeColor,
      fontSize: fontSize ?? this.fontSize,
    );
  }

  @override
  List<Object?> get props => [
        id,
        dbVersion,
        themeMode,
        themeColor,
        fontSize,
      ];
}
