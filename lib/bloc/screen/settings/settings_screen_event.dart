import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class SettingsScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SettingsScreenInitialized extends SettingsScreenEvent {}

final class SettingsScreenProfileRequested extends SettingsScreenEvent {}

final class SettingsScreenSignedIn extends SettingsScreenEvent {}

final class SettingsScreenLoggedOut extends SettingsScreenEvent {}

final class SettingsScreenThemeModeChanged extends SettingsScreenEvent {
  final ThemeMode themeMode;

  SettingsScreenThemeModeChanged({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}

final class SettingsScreenThemeColorChanged extends SettingsScreenEvent {
  final int themeColor;

  SettingsScreenThemeColorChanged({required this.themeColor});

  @override
  List<Object> get props => [themeColor];
}
