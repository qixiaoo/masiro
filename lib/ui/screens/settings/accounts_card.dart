import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/bloc/global/user/user_bloc.dart';
import 'package:masiro/bloc/global/user/user_state.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_event.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/cookie.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/misc/router.dart';

class AccountsCard extends StatelessWidget {
  const AccountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        leading: const Icon(Icons.compare_arrows_rounded),
        title: Text(localizations.switchAccounts),
        onTap: () => _switchAccounts(context),
      ),
    );
  }

  void _switchAccounts(BuildContext context) {
    final settingsScreenBloc = context.read<SettingsScreenBloc>();
    showDialog(
      context: context,
      builder: (context) {
        return _AccountsDialog(settingsScreenBloc: settingsScreenBloc);
      },
    );
  }
}

class _AccountsDialog extends StatefulWidget {
  final SettingsScreenBloc settingsScreenBloc;

  const _AccountsDialog({required this.settingsScreenBloc});

  @override
  State<_AccountsDialog> createState() => _AccountsDialogState();
}

class _AccountsDialogState extends State<_AccountsDialog> {
  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    final colorScheme = context.colorScheme();

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final userBloc = context.read<UserBloc>();
        final settingsScreenBloc = widget.settingsScreenBloc;

        final userList = state.userList;
        final currentUser = state.currentUser;

        return AlertDialog(
          title: Text(localizations.switchAccounts),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: userList.map((user) {
              final isActive = currentUser?.userId == user.userId;
              final activeIcon = Icon(
                Icons.check_circle_outline_rounded,
                color: colorScheme.primary,
              );
              return ListTile(
                title: Text(user.userName),
                subtitle: Text(user.userId.toString()),
                trailing: isActive ? activeIcon : null,
                onTap: () async {
                  await userBloc.switchCurrentUser(user.userId);
                  settingsScreenBloc.add(SettingsScreenProfileRefreshed());
                  if (!context.mounted) {
                    return;
                  }
                  context.pop();
                },
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              child: Text(localizations.cancel),
              onPressed: () => context.pop(),
            ),
            TextButton(
              child: Text(localizations.addAnAccount),
              onPressed: () async {
                if (isMobilePhone) {
                  await clearWebviewCookies();
                }
                if (!context.mounted) {
                  return;
                }
                context.go(RoutePath.login);
              },
            ),
          ],
        );
      },
    );
  }
}
