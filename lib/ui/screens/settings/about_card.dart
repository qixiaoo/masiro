import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/router.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: () => context.push(RoutePath.about),
        leading: const Icon(Icons.info),
        title: Text(localizations.about),
      ),
    );
  }
}
