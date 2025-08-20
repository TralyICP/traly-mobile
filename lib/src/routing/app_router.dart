import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:traly/src/features/bottom_navigation/views/bottom_nav_bar.dart';
import 'package:traly/src/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:traly/src/features/settings/screens/settings_screen.dart';
import 'package:traly/src/routing/router_config.dart';
import 'package:traly/src/features/splash/splash_screen.dart';

final class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  AppRouter(WidgetRef ref) {
    mainRouter = _getRouter(ref);
  }

  late GoRouter mainRouter;

  GoRouter _getRouter(WidgetRef ref) => GoRouter(
          initialLocation: RoutePath.splash,
          navigatorKey: rootNavigatorKey,
          debugLogDiagnostics: kDebugMode,
          routes: [
            GoRoute(
              path: RoutePath.splash,
              name: AppRoute.splashscreen.name,
              builder: (context, state) => const SplashScreen(),
            ),
            GoRoute(
              path: RoutePath.onboarding,
              name: AppRoute.onboarding.name,
              builder: (context, state) => const OnboardingScreen(),
            ),
            GoRoute(
                path: '${RoutePath.bottomNavigation}/:page',
                name: AppRoute.bottomNavigation.name,
                builder: (context, state) {
                  return const BottomNavBar();
                }),
            GoRoute(
              path: '${RoutePath.settings}/:page',
              name: AppRoute.settings.name,
              builder: (context, state) {
                final pageId = state.pathParameters['page'];
                final pageItem = SettingsPage.values.firstWhere(
                    (element) => element.name == pageId,
                    orElse: () =>
                        throw Exception('No page id found for $pageId'));

                return SettingsScreen(
                  page: pageItem,
                );
              },
            ),
          ]);
}
