import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class AppConfiguration extends Equatable {
  final Id id;
  final int dbVersion;
  final int lastSignInTime;
  final ThemeMode themeMode;
  final int themeColor;

  const AppConfiguration({
    required this.id,
    required this.dbVersion,
    required this.lastSignInTime,
    required this.themeMode,
    required this.themeColor,
  });

  AppConfiguration copyWith({
    Id? id,
    int? dbVersion,
    int? lastSignInTime,
    ThemeMode? themeMode,
    int? themeColor,
  }) {
    return AppConfiguration(
      id: id ?? this.id,
      dbVersion: dbVersion ?? this.dbVersion,
      lastSignInTime: lastSignInTime ?? this.lastSignInTime,
      themeMode: themeMode ?? this.themeMode,
      themeColor: themeColor ?? this.themeColor,
    );
  }

  @override
  List<Object?> get props => [
        id,
        dbVersion,
        lastSignInTime,
        themeMode,
        themeColor,
      ];
}
