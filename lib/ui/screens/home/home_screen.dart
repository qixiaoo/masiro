import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/router.dart';
import 'package:masiro/ui/widgets/message.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();
    return Column(
      children: [
        AppBar(
          actions: [
            IconButton(
              onPressed: () => context.push(RoutePath.search),
              icon: const Icon(Icons.search_rounded),
            ),
          ],
        ),
        Expanded(
          child: Message(message: localizations.noContentMessage),
        ),
      ],
    );
  }
}
