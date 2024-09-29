import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/app_configuration.dart';
import 'package:masiro/data/repository/model/profile.dart';

class SettingsScreenState extends Equatable {
  final Profile? profile;
  final AppConfiguration? config;

  const SettingsScreenState({
    this.profile,
    this.config,
  });

  SettingsScreenState copyWith({Profile? profile, AppConfiguration? config}) {
    return SettingsScreenState(
      profile: profile ?? this.profile,
      config: config ?? this.config,
    );
  }

  @override
  List<Object?> get props => [profile, config];
}
