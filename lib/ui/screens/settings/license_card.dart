import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/router.dart';

class LicenseCard extends StatelessWidget {
  const LicenseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: () => context.push(RoutePath.licenses),
        leading: const Icon(Icons.code_rounded),
        title: Text(localizations.license),
      ),
    );
  }
}
