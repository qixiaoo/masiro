import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_event.dart';
import 'package:masiro/misc/context.dart';

class ThemeModeCard extends StatelessWidget {
  final ThemeMode themeMode;

  const ThemeModeCard({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    final leadingIcon = switch (themeMode) {
      ThemeMode.light => Icons.sunny,
      ThemeMode.dark => Icons.mode_night_rounded,
      ThemeMode.system => Icons.auto_awesome_rounded,
    };

    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        leading: Icon(leadingIcon),
        title: Text(localizations.themeMode),
        onTap: () => _selectThemeMode(context),
      ),
    );
  }

  void _selectThemeMode(BuildContext context) {
    final bloc = context.read<SettingsScreenBloc>();
    showDialog(
      context: context,
      builder: (context) {
        return _ThemeModeDialog(
          themeMode: themeMode,
          onThemeModeChanged: (value) =>
              bloc.add(SettingsScreenThemeModeChanged(themeMode: value)),
        );
      },
    );
  }
}

class _ThemeModeDialog extends StatelessWidget {
  final ThemeMode themeMode;
  final void Function(ThemeMode) onThemeModeChanged;

  const _ThemeModeDialog({
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(localizations.lightMode),
            leading: Radio<ThemeMode>(
              value: ThemeMode.light,
              groupValue: themeMode,
              onChanged: (value) => _onThemeModeSelected(value, context),
            ),
            onTap: () => _onThemeModeSelected(ThemeMode.light, context),
          ),
          ListTile(
            title: Text(localizations.dartMode),
            leading: Radio<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: themeMode,
              onChanged: (value) => _onThemeModeSelected(value, context),
            ),
            onTap: () => _onThemeModeSelected(ThemeMode.dark, context),
          ),
          ListTile(
            title: Text(localizations.systemMode),
            leading: Radio<ThemeMode>(
              value: ThemeMode.system,
              groupValue: themeMode,
              onChanged: (value) => _onThemeModeSelected(value, context),
            ),
            onTap: () => _onThemeModeSelected(ThemeMode.system, context),
          ),
        ],
      ),
    );
  }

  void _onThemeModeSelected(ThemeMode? value, BuildContext context) {
    onThemeModeChanged(value ?? ThemeMode.system);
    context.pop();
  }
}
