import 'package:equatable/equatable.dart';

sealed class SettingsScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SettingsScreenInitialized extends SettingsScreenEvent {}

final class SettingsScreenProfileRequested extends SettingsScreenEvent {}

final class SettingsScreenProfileRefreshed extends SettingsScreenEvent {}
