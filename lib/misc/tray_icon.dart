import 'package:flutter/material.dart';
import 'package:masiro/misc/context.dart';
import 'package:tray_manager/tray_manager.dart';

class MenuItemKey {
  static const String show = 'show_window';
  static const String hide = 'hide_window';
  static const String exit = 'exit_app';
}

Future<void> initSystemTray(BuildContext context) async {
  final localizations = context.localizations();

  await trayManager.setIcon(
    'images/tray_icon.png',
  );

  final Menu menu = Menu(
    items: [
      MenuItem(
        key: MenuItemKey.show,
        label: localizations.showWindow,
      ),
      MenuItem(
        key: MenuItemKey.hide,
        label: localizations.hideWindow,
      ),
      MenuItem.separator(),
      MenuItem(
        key: MenuItemKey.exit,
        label: localizations.exit,
      ),
    ],
  );

  await trayManager.setContextMenu(menu);
}
