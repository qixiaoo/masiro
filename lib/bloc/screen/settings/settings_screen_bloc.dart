import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_event.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_state.dart';
import 'package:masiro/data/repository/masiro_repository.dart';
import 'package:masiro/di/get_it.dart';

class SettingsScreenBloc
    extends Bloc<SettingsScreenEvent, SettingsScreenState> {
  final masiroRepository = getIt<MasiroRepository>();

  SettingsScreenBloc() : super(const SettingsScreenState()) {
    on<SettingsScreenProfileRequested>(_onSettingsScreenProfileRequested);
  }

  Future<void> _onSettingsScreenProfileRequested(
    SettingsScreenProfileRequested event,
    Emitter<SettingsScreenState> emit,
  ) async {
    final profile = await masiroRepository.getProfile();
    emit(state.copyWith(profile: profile));
  }
}
