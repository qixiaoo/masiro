import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/misc/cookie.dart';
import 'package:masiro/ui/screens/error/error_screen.dart';
import 'package:masiro/ui/screens/favorites/favorites_screen.dart';
import 'package:masiro/ui/screens/home/home_screen.dart';
import 'package:masiro/ui/screens/login/login_screen.dart';
import 'package:masiro/ui/screens/novel/novel_screen.dart';
import 'package:masiro/ui/screens/reader/reader_screen.dart';
import 'package:masiro/ui/screens/settings/settings_screen.dart';
import 'package:masiro/ui/widgets/router_outlet_with_nav_bar.dart';

class RoutePath {
  static const String home = '/home';
  static const String favorites = '/favorites';
  static const String settings = '/settings';
  static const String login = '/login';
  static const String novel = '/novel';
  static const String reader = '/reader';
  static const String error = '/error';
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

// GoRouter configuration
final routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RoutePath.favorites,
  debugLogDiagnostics: true,
  errorBuilder: (context, state) => ErrorScreen(message: state.error?.message),
  routes: [
    _applicationShellRoutes,
    GoRoute(
      path: RoutePath.login,
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: RoutePath.reader,
      builder: (context, state) {
        final params = state.extra as Map;
        final novelId = params['novelId']!;
        final chapterId = params['chapterId']!;
        return ReaderScreen(
          novelId: novelId,
          chapterId: chapterId,
        );
      },
    ),
  ],
);

final _applicationShellRoutes = ShellRoute(
  navigatorKey: _shellNavigatorKey,
  builder: (BuildContext context, GoRouterState state, Widget child) {
    return RouterOutletWithNavBar(child: child);
  },
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RoutePath.favorites,
      builder: (context, state) => const FavoritesScreen(),
      redirect: (context, state) async {
        final cookies = await getCookies();
        if (cookies.isEmpty) {
          return RoutePath.login;
        } else {
          return RoutePath.favorites;
        }
      },
    ),
    GoRoute(
      path: RoutePath.settings,
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: RoutePath.novel,
      builder: (context, state) {
        final novelId = (state.extra as Map)['novelId']!;
        return NovelScreen(novelId: novelId);
      },
    ),
  ],
);
