import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:masiro/misc/cookie.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/ui/screens/error/error_screen.dart';
import 'package:masiro/ui/screens/favorites/favorites_screen.dart';
import 'package:masiro/ui/screens/login/login_screen.dart';
import 'package:masiro/ui/screens/novel/novel_screen.dart';
import 'package:masiro/ui/screens/reader/reader_screen.dart';
import 'package:masiro/ui/screens/search/search_screen.dart';
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
  static const String search = '/search';
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
  observers: [FlutterSmartDialog.observer],
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
    if (isMobilePhone) ...[
      _novelScreenRoute,
      _searchScreenRoute,
    ],
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
      builder: (context, state) => const SearchScreen(),
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
    if (isDesktop) ...[
      _novelScreenRoute,
      _searchScreenRoute,
    ],
  ],
);

final _novelScreenRoute = GoRoute(
  path: RoutePath.novel,
  builder: (context, state) {
    final extra = state.extra as Map;
    final novelId = extra['novelId']!;
    return NovelScreen(novelId: novelId);
  },
);

final _searchScreenRoute = GoRoute(
  path: RoutePath.search,
  builder: (context, state) => const SearchScreen(),
);
