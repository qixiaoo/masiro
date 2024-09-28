import 'package:equatable/equatable.dart';
import 'package:masiro/data/repository/model/profile.dart';

class SettingsScreenState extends Equatable {
  final Profile? profile;

  const SettingsScreenState({
    this.profile,
  });

  SettingsScreenState copyWith({Profile? profile}) {
    return SettingsScreenState(
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object?> get props => [profile];
}
