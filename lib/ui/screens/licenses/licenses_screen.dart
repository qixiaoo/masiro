import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/oss_licenses.dart';
import 'package:masiro/misc/router.dart';

class LicensesScreen extends StatefulWidget {
  const LicensesScreen({super.key});

  @override
  State<LicensesScreen> createState() => _LicensesScreenState();
}

class _LicensesScreenState extends State<LicensesScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = context.localizations();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(localizations.license),
      ),
      body: ListView.builder(
        itemCount: dependencies.length,
        itemBuilder: (context, index) {
          final package = dependencies[index];
          return ListTile(
            title: Text(package.name),
            onTap: () => context.push(
              RoutePath.license,
              extra: {
                'name': package.name,
                'license': package.license,
              },
            ),
          );
        },
      ),
    );
  }
}
