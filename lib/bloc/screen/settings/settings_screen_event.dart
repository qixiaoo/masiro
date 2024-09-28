import 'package:equatable/equatable.dart';

sealed class SettingsScreenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SettingsScreenProfileRequested extends SettingsScreenEvent {}
