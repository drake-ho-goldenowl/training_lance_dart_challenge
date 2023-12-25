import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wishlist_app/src/features/favorite/logic/favorite_bloc.dart';
import 'package:wishlist_app/src/features/home/logic/home_bloc.dart';
import 'package:wishlist_app/src/features/favorite/view/favorite_screen.dart';
import 'package:wishlist_app/src/features/home/view/home_screen.dart';
import 'package:wishlist_app/src/network/data/app_constants.dart';
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
          builder: (_, __) => BlocProvider(
                create: (context) => HomeBloc(RawData.allProducts),
                child: const HomeScreen(),
              ),
          routes: <RouteBase>[
            GoRoute(
                parentNavigatorKey: AppCoordinator.navigatorKey,
                path: AppRouteNames.favorite.buildSubPathParam,
                name: AppRouteNames.favorite.name,
                builder: (_, state) {
                  final data = RawDataUtils.decodeData(
                      state.pathParameters['listFavorited']!);
                  return BlocProvider(
                    create: (context) => FavoriteBloc(data),
                    child: const FavoriteScreen(),
                  );
                })
          ]),
    ],
    errorBuilder: (_, __) => Container(),
  );
}
