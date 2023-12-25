import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:wishlist_app/src/network/model/model.dart';
import 'package:wishlist_app/src/utils/raw_data_utils.dart';

import 'route_name.dart';
import 'router.dart';

class AppCoordinator {
  static AppRouter get rootRouter => GetIt.I<AppRouter>();
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final shellKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;

  static void pop<T extends Object?>([T? result]) => context.pop(result);

  static void goNamed(
    String name, {
    Map<String, String> params = const <String, String>{},
    Map<String, dynamic> queryParams = const <String, dynamic>{},
    Object? extra,
  }) =>
      context.goNamed(
        name,
        pathParameters: params,
        queryParameters: queryParams,
        extra: extra,
      );

  static void showHomeScreen() => context.goNamed(AppRouteNames.home.name);
  static Future<List<Product>?> showFavoriteScreen(
      {required List<Product> listFavorited}) async {
    return await context.pushNamed(
      AppRouteNames.favorite.name,
      pathParameters: {AppRouteNames.favorite.paramName!: RawDataUtils.encodeData(listFavorited)},
    );
  }
}
