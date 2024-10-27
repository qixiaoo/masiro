import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/data/repository/app_configuration_repository.dart';
import 'package:masiro/di/get_it.dart';
import 'package:masiro/misc/constant.dart';

class AppThemeCubit extends Cubit<AppThemeData> {
  final _appConfigurationRepository = getIt<AppConfigurationRepository>();

  AppThemeCubit() : super(const AppThemeData()) {
    _initialize();
  }

  Future<void> _initialize() async {
    final config = await _appConfigurationRepository.getAppConfiguration();
    emit(
      state.copyWith(
        themeMode: config.themeMode,
        themeColor: config.themeColor,
      ),
    );
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _appConfigurationRepository.setThemeMode(themeMode);
    emit(state.copyWith(themeMode: themeMode));
  }

  Future<void> setThemeColor(int themeColor) async {
    await _appConfigurationRepository.setThemeColor(themeColor);
    emit(state.copyWith(themeColor: themeColor));
  }
}

class AppThemeData extends Equatable {
  final ThemeMode themeMode;
  final int themeColor;

  const AppThemeData({
    this.themeMode = ThemeMode.system,
    this.themeColor = defaultThemeColor,
  });

  AppThemeData copyWith({
    ThemeMode? themeMode,
    int? themeColor,
  }) {
    return AppThemeData(
      themeMode: themeMode ?? this.themeMode,
      themeColor: themeColor ?? this.themeColor,
    );
  }

  @override
  List<Object?> get props => [themeMode, themeColor];
}
