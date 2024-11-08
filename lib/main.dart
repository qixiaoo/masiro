import 'package:flutter/material.dart';
import 'package:masiro/data/database/migration/migration.dart';
import 'package:masiro/di/get_it.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/ui/app.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (isDesktop) {
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(title: 'Masiro', center: true);
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  await setupGetIt();

  await performMigrationIfNeeded();

  runApp(const App());
}
