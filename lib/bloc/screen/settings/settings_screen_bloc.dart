import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_event.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_state.dart';
import 'package:masiro/data/repository/app_configuration_repository.dart';
import 'package:masiro/data/repository/novel_record_repository.dart';
import 'package:masiro/data/repository/profile_repository.dart';
import 'package:masiro/di/get_it.dart';

typedef _SettingsScreenBloc = Bloc<SettingsScreenEvent, SettingsScreenState>;

class SettingsScreenBloc extends _SettingsScreenBloc {
  final appConfigurationRepository = getIt<AppConfigurationRepository>();
  final novelRecordRepository = getIt<NovelRecordRepository>();
  final profileRepository = getIt<ProfileRepository>();

  SettingsScreenBloc() : super(const SettingsScreenState()) {
    on<SettingsScreenInitialized>(_onSettingsScreenInitialized);
    on<SettingsScreenProfileRequested>(_onSettingsScreenProfileRequested);
    on<SettingsScreenProfileRefreshed>(_onSettingsScreenProfileRefreshed);
  }

  Future<void> _onSettingsScreenInitialized(
    SettingsScreenInitialized event,
    Emitter<SettingsScreenState> emit,
  ) async {
    final config = await appConfigurationRepository.getAppConfiguration();
    emit(state.copyWith(config: config));
  }

  Future<void> _onSettingsScreenProfileRequested(
    SettingsScreenProfileRequested event,
    Emitter<SettingsScreenState> emit,
  ) async {
    final profile = await profileRepository.getProfile();
    emit(state.copyWith(profile: profile));
  }

  Future<void> _onSettingsScreenProfileRefreshed(
    SettingsScreenProfileRefreshed event,
    Emitter<SettingsScreenState> emit,
  ) async {
    final profile = await profileRepository.refreshProfile();
    emit(state.copyWith(profile: profile));
  }
}
