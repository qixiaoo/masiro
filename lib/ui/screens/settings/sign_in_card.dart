import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_bloc.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/time.dart';
import 'package:masiro/misc/toast.dart';

class SignInCard extends StatelessWidget {
  final int lastSignInTime;

  const SignInCard({super.key, required this.lastSignInTime});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    final bloc = context.read<SettingsScreenBloc>();
    final hasSignedIn = isTimestampToday(lastSignInTime);

    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: hasSignedIn ? null : () => _signIn(bloc),
        leading: hasSignedIn
            ? const Icon(Icons.lightbulb_rounded)
            : const Icon(Icons.lightbulb_outline_rounded),
        title: Text(
          hasSignedIn ? localizations.hasSignedIn : localizations.signIn,
        ),
      ),
    );
  }

  Future<void> _signIn(SettingsScreenBloc bloc) async {
    String msg;
    try {
      msg = await bloc.signIn();
    } catch (e) {
      msg = e.toString();
    }
    msg.toast();
  }
}
