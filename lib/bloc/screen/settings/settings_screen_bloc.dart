import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_event.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_state.dart';
import 'package:masiro/data/repository/app_configuration_repository.dart';
import 'package:masiro/data/repository/masiro_repository.dart';
import 'package:masiro/di/get_it.dart';

class SettingsScreenBloc
    extends Bloc<SettingsScreenEvent, SettingsScreenState> {
  final masiroRepository = getIt<MasiroRepository>();
  final appConfigurationRepository = getIt<AppConfigurationRepository>();

  SettingsScreenBloc() : super(const SettingsScreenState()) {
    on<SettingsScreenInitialized>(_onSettingsScreenInitialized);
    on<SettingsScreenProfileRequested>(_onSettingsScreenProfileRequested);
    on<SettingsScreenSignedIn>(_onSettingsScreenSignedIn);
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
    final profile = await masiroRepository.getProfile();
    emit(state.copyWith(profile: profile));
  }

  Future<void> _onSettingsScreenSignedIn(
    SettingsScreenSignedIn event,
    Emitter<SettingsScreenState> emit,
  ) async {
    final config = state.config;
    if (config == null) {
      return;
    }
    final nextConfig = config.copyWith(
      lastSignInTime: DateTime.now().millisecondsSinceEpoch,
    );
    final nextState = state.copyWith(config: nextConfig);
    await appConfigurationRepository.putAppConfiguration(nextConfig);
    emit(nextState);
  }

  Future<String> signIn() async {
    final msg = await masiroRepository.signIn();
    add(SettingsScreenSignedIn());
    add(SettingsScreenProfileRequested());
    return msg;
  }
}
