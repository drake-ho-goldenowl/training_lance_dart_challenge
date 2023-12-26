import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/feature/dashboard/logic/dashboard_bloc.dart';
import 'package:gallery_app/src/feature/dashboard/view/dashboard_view.dart';
import 'package:gallery_app/src/network/data/app_constants.dart';
import 'package:gallery_app/src/router/coordinator.dart';
import 'package:gallery_app/src/router/route_name.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final router = GoRouter(
    navigatorKey: AppCoordinator.navigatorKey,
    initialLocation: AppRouteNames.dashboard.path,
    debugLogDiagnostics: kDebugMode,
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.dashboard.path,
        name: AppRouteNames.dashboard.name,
        builder: (_, __) => BlocProvider(
          create: (context) => DashboardBloc(AppConstant.listWidgetFlutter),
          child: const DashboardScreen(),
        ),
      ),
    ],
    errorBuilder: (_, __) => Container(),
  );
}
