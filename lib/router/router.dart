import 'package:flutter/material.dart';
import 'package:fulltimeforce_challenge/commits/view/commits_page.dart';
import 'package:fulltimeforce_challenge/home/view/home_page.dart';
import 'package:fulltimeforce_challenge/profile/view/profile_page.dart';
import 'package:fulltimeforce_challenge/router/app_routes.dart';
import 'package:fulltimeforce_challenge/settings/view/settings_page.dart';
import 'package:fulltimeforce_challenge/splash/view/splash_page.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellCommitNavigatorKey = GlobalKey<NavigatorState>();
final _shellProfileNavigatorKey = GlobalKey<NavigatorState>();
final _shellSettingsNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return HomePage(
          navigationShell: navigationShell,
        );
      },
      branches: <StatefulShellBranch>[
        /// Brach commit
        StatefulShellBranch(
          navigatorKey: _shellCommitNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.commits,
              name: 'Commits',
              builder: (BuildContext context, GoRouterState state) =>
                  const CommitsPage(),
            ),
          ],
        ),

        /// Brach profile
        StatefulShellBranch(
          navigatorKey: _shellProfileNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.profile,
              name: 'Profile',
              builder: (BuildContext context, GoRouterState state) =>
                  const ProfilePage(),
            ),
          ],
        ),

        /// Brach settings
        StatefulShellBranch(
          navigatorKey: _shellSettingsNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: AppRoutes.settings,
              name: 'Settings',
              builder: (BuildContext context, GoRouterState state) =>
                  const SettingsPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
