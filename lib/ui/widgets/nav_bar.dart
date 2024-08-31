import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/misc/context.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/misc/router.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void _onDestinationSelected(index) {
    switch (index) {
      case 0:
        context.go(RoutePath.home);
      case 1:
        context.go(RoutePath.favorites);
      case 2:
        context.go(RoutePath.settings);
    }
  }

  int? _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(RoutePath.home)) {
      return 0;
    }
    if (location.startsWith(RoutePath.favorites)) {
      return 1;
    }
    if (location.startsWith(RoutePath.settings)) {
      return 2;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return isDesktop
        ? buildNavigationRail(context)
        : buildNavigationBar(context);
  }

  Widget buildNavigationRail(BuildContext context) {
    final localizations = context.localizations();
    return NavigationRail(
      destinations: [
        NavigationRailDestination(
          icon: const Icon(Icons.receipt_long_outlined),
          selectedIcon: const Icon(Icons.receipt_long),
          label: Text(localizations.home),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.favorite_outline_outlined),
          selectedIcon: const Icon(Icons.favorite),
          label: Text(localizations.favorites),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings),
          label: Text(localizations.settings),
        ),
      ],
      labelType: NavigationRailLabelType.all,
      selectedIndex: _calculateSelectedIndex(context),
      onDestinationSelected: _onDestinationSelected,
    );
  }

  Widget buildNavigationBar(BuildContext context) {
    final localizations = context.localizations();
    return NavigationBar(
      onDestinationSelected: _onDestinationSelected,
      selectedIndex: _calculateSelectedIndex(context) ?? 0,
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.receipt_long_outlined),
          selectedIcon: const Icon(Icons.receipt_long),
          label: localizations.home,
        ),
        NavigationDestination(
          icon: const Icon(Icons.favorite_outline_outlined),
          selectedIcon: const Icon(Icons.favorite),
          label: localizations.favorites,
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings),
          label: localizations.settings,
        ),
      ],
    );
  }
}
