import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/bloc/global/user/user_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_event.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/router.dart';

class LogoutCard extends StatelessWidget {
  const LogoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        textColor: Colors.red.shade500,
        iconColor: Colors.red.shade500,
        onTap: () => _logout(context),
        leading: const Icon(Icons.logout_rounded),
        title: Text(localizations.logout),
      ),
    );
  }

  void _logout(BuildContext context) {
    final userBloc = context.read<UserBloc>();
    final settingsScreenBloc = context.read<SettingsScreenBloc>();
    showDialog(
      context: context,
      builder: (context) {
        return _LogoutDialog(
          onLogout: () async {
            final needsRedirect = await userBloc.logout();
            if (!needsRedirect) {
              settingsScreenBloc.add(SettingsScreenProfileRefreshed());
            }
            if (!context.mounted || !needsRedirect) {
              return;
            }
            context.go(RoutePath.login);
          },
        );
      },
    );
  }
}

class _LogoutDialog extends StatelessWidget {
  final void Function() onLogout;

  const _LogoutDialog({required this.onLogout});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    return AlertDialog(
      title: Text(localizations.logout),
      content: Text(localizations.logoutPrompt),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(localizations.cancel),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onLogout();
          },
          child: Text(localizations.confirm),
        ),
      ],
    );
  }
}
