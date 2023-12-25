import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wishlist_app/src/features/home/view/favorite_screen.dart';
import 'package:wishlist_app/src/features/home/view/home_screen.dart';
import 'package:wishlist_app/src/router/coordinator.dart';
import 'package:wishlist_app/src/router/route_name.dart';
import 'package:wishlist_app/src/utils/raw_data_utils.dart';

class AppRouter {
  final router = GoRouter(
    navigatorKey: AppCoordinator.navigatorKey,
    initialLocation: AppRouteNames.home.path,
    debugLogDiagnostics: kDebugMode,
    routes: <RouteBase>[
      GoRoute(
          parentNavigatorKey: AppCoordinator.navigatorKey,
          path: AppRouteNames.home.path,
          name: AppRouteNames.home.name,
          builder: (_, __) => const HomeScreen(),
          routes: <RouteBase>[
            GoRoute(
                parentNavigatorKey: AppCoordinator.navigatorKey,
                path: AppRouteNames.favorite.buildSubPathParam,
                name: AppRouteNames.favorite.name,
                builder: (_, state) {
                  return FavoriteScreen(
                    listFavorited: RawDataUtils.decodeData(
                        state.pathParameters['listFavorited']!),
                  );
                })
          ]),
    ],
    errorBuilder: (_, __) => Container(),
  );
}
