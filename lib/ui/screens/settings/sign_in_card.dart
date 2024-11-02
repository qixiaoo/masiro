import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/global/user/user_bloc.dart';
import 'package:masiro/bloc/global/user/user_state.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_event.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/time.dart';
import 'package:masiro/misc/toast.dart';

class SignInCard extends StatelessWidget {
  const SignInCard({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    final userBloc = context.read<UserBloc>();
    final settingsScreenBloc = context.read<SettingsScreenBloc>();

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final lastSignInTime = state.currentUser?.lastSignInTime ?? 0;
        final hasSignedIn = isTimestampToday(lastSignInTime);

        return Card(
          clipBehavior: Clip.hardEdge,
          child: ListTile(
            onTap: hasSignedIn
                ? null
                : () => _signIn(userBloc, settingsScreenBloc),
            leading: hasSignedIn
                ? const Icon(Icons.lightbulb_rounded)
                : const Icon(Icons.lightbulb_outline_rounded),
            title: Text(
              hasSignedIn ? localizations.hasSignedIn : localizations.signIn,
            ),
          ),
        );
      },
    );
  }

  Future<void> _signIn(
    UserBloc userBloc,
    SettingsScreenBloc settingsScreenBloc,
  ) async {
    String msg;
    try {
      msg = await userBloc.signIn();
      settingsScreenBloc.add(SettingsScreenProfileRefreshed());
    } catch (e) {
      msg = e.toString();
    }
    msg.toast();
  }
}
