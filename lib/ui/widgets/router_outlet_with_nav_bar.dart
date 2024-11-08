import 'package:flutter/material.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/misc/tray_icon.dart';
import 'package:masiro/ui/widgets/adaptive_status_bar_style.dart';
import 'package:masiro/ui/widgets/nav_bar.dart';

bool _systemTrayInitialized = false;

class RouterOutletWithNavBar extends StatefulWidget {
  const RouterOutletWithNavBar({required this.child, super.key});

  /// The widget to display in the body of the Scaffold.
  final Widget child;

  @override
  State<RouterOutletWithNavBar> createState() => _RouterOutletWithNavBarState();
}

class _RouterOutletWithNavBarState extends State<RouterOutletWithNavBar> {
  @override
  void initState() {
    super.initState();
    _initSystemTray();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: isMobilePhone ? const NavBar() : null,
      body: isDesktop
          ? Row(
              children: [
                const NavBar(),
                const VerticalDivider(
                  thickness: 0.0,
                  width: 1.0,
                ),
                Expanded(child: Center(child: widget.child)),
              ],
            )
          : Column(
              children: [
                const AdaptiveStatusBarStyle(),
                Expanded(child: widget.child),
              ],
            ),
    );
  }

  void _initSystemTray() {
    if (!isDesktop) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_systemTrayInitialized) {
        return;
      }
      initSystemTray(context);
      _systemTrayInitialized = true;
    });
  }
}
