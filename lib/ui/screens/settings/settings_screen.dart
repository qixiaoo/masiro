import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_bloc.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_event.dart';
import 'package:masiro/bloc/screen/settings/settings_screen_state.dart';
import 'package:masiro/misc/easy_refresh.dart';
import 'package:masiro/ui/screens/settings/profile_card.dart';
import 'package:masiro/ui/screens/settings/sign_in_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SettingsScreenBloc()
          ..add(SettingsScreenInitialized())
          ..add(SettingsScreenProfileRequested()),
        child: BlocBuilder<SettingsScreenBloc, SettingsScreenState>(
          builder: (context, state) {
            return buildScreen(context, state);
          },
        ),
      ),
    );
  }

  Widget buildScreen(BuildContext context, SettingsScreenState state) {
    final bloc = context.read<SettingsScreenBloc>();
    final lastSignInTime = state.config?.lastSignInTime ?? 0;

    return EasyRefresh(
      header: classicHeader(context),
      onRefresh: () async {
        bloc.add(SettingsScreenProfileRequested());
      },
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ProfileCard(profile: state.profile),
          const SizedBox(height: 20),
          SignInCard(lastSignInTime: lastSignInTime),
        ],
      ),
    );
  }
}
