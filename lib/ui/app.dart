import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_event.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_state.dart';
import 'package:masiro/misc/constant.dart';
import 'package:masiro/misc/router.dart';
import 'package:masiro/misc/tray_icon.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WindowListener, TrayListener {
  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
    trayManager.addListener(this);
  }

  @override
  void onWindowClose() {
    windowManager.hide();
  }

  @override
  void onTrayIconMouseDown() {
    trayManager.popUpContextMenu();
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) {
    switch (menuItem.key) {
      case MenuItemKey.show:
        windowManager.show();
      case MenuItemKey.hide:
        windowManager.hide();
      case MenuItemKey.exit:
        windowManager.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsScreenBloc>(
          create: (context) =>
              SettingsScreenBloc()..add(SettingsScreenInitialized()),
        ),
      ],
      child: BlocBuilder<SettingsScreenBloc, SettingsScreenState>(
        buildWhen: (prev, curr) {
          return prev.config?.themeMode != curr.config?.themeMode ||
              prev.config?.themeColor != curr.config?.themeColor;
        },
        builder: (context, state) {
          final config = state.config;
          final themeMode = config?.themeMode ?? ThemeMode.system;
          final themeColor = config?.themeColor ?? defaultThemeColor;

          return MaterialApp.router(
            title: 'masiro',
            themeMode: themeMode,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(themeColor),
                brightness: Brightness.light,
              ),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(themeColor),
                brightness: Brightness.dark,
              ),
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: routerConfig,
            builder: FlutterSmartDialog.init(),
          );
        },
      ),
    );
  }
}
