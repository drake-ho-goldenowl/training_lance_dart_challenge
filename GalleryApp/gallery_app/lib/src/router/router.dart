import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/feature/bottom_app_bar_view/logic/bottom_app_bar_bloc.dart';
import 'package:gallery_app/src/feature/bottom_app_bar_view/view/bottom_app_bar_view.dart';
import 'package:gallery_app/src/feature/button_view/view/button_view.dart';
import 'package:gallery_app/src/feature/container_view/logic/container_bloc.dart';
import 'package:gallery_app/src/feature/container_view/view/container_view.dart';
import 'package:gallery_app/src/feature/cupertino_view/logic/cupertino_bloc.dart';
import 'package:gallery_app/src/feature/cupertino_view/view/cupertino_view.dart';
import 'package:gallery_app/src/feature/custom_box_shape_view/view/custom_box_shape_view.dart';
import 'package:gallery_app/src/feature/dashboard/logic/dashboard_bloc.dart';
import 'package:gallery_app/src/feature/dashboard/view/dashboard_view.dart';
import 'package:gallery_app/src/feature/image_view/view/image_view.dart';
import 'package:gallery_app/src/feature/row_column_view/logic/row_column_bloc.dart';
import 'package:gallery_app/src/feature/row_column_view/view/row_column_view.dart';
import 'package:gallery_app/src/feature/stack_align_view/logic/stack_align_bloc.dart';
import 'package:gallery_app/src/feature/stack_align_view/view/stack_align_view.dart';
import 'package:gallery_app/src/feature/text_view/view/rich_text_view.dart';
import 'package:gallery_app/src/feature/wrap_chip_view/logic/wrap_chip_bloc.dart';
import 'package:gallery_app/src/feature/wrap_chip_view/view/wrap_chip_view.dart';
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
                create: (context) =>
                    DashboardBloc(AppConstant.listWidgetFlutter),
                child: const DashboardScreen(),
              ),
          routes: <RouteBase>[
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.richText.subPath,
              name: AppRouteNames.richText.name,
              builder: (_, __) => const RichTextView(),
            ),
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.container.subPath,
              name: AppRouteNames.container.name,
              builder: (_, __) => BlocProvider(
                create: (context) => ContainerBloc(
                    listBackGrColorOptions:
                        AppConstant.listBackgroundColorOptions,
                    listBlendModeOptions:
                        AppConstant.listBlendModeContainerOptions,
                    listBorderRadiusOptions:
                        AppConstant.listBorderRadiusOptions),
                child: const ContainerView(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.rowColumn.subPath,
              name: AppRouteNames.rowColumn.name,
              builder: (_, __) => BlocProvider(
                create: (context) => RowColumnBloc(
                  listCrossAxisAlignmentOptions:
                      AppConstant.listCrossAxisSizeOptions,
                  listMainAxisAlignmentOptions:
                      AppConstant.listMainAxisAligmentOptions,
                  listMainAxisSizeOptions: AppConstant.listMainAxisSizeOptions,
                  listTextBaselineOptions: AppConstant.listTextBaselineOptions,
                  listTextDirectionOptions:
                      AppConstant.listTextDirectionOptions,
                  listVerticalDirectionOptions:
                      AppConstant.listVerticalDirectionOptions,
                ),
                child: const RowColumnView(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.stackAlign.subPath,
              name: AppRouteNames.stackAlign.name,
              builder: (_, __) => BlocProvider(
                create: (context) => StackAlignBloc(
                  listAlignmentOptions: AppConstant.listAlignmentOptions,
                  listClipOptions: AppConstant.listClipOptions,
                  listStackFitOptions: AppConstant.listStackFitOptions,
                  listTextDirectionOptions:
                      AppConstant.listTextDirectionOptions,
                ),
                child: const StackAlignView(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.cupertino.subPath,
              name: AppRouteNames.cupertino.name,
              builder: (_, __) => BlocProvider(
                create: (context) => CupertinoBloc(),
                child: const CupertinoView(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.bottomAppBar.subPath,
              name: AppRouteNames.bottomAppBar.name,
              builder: (_, __) => BlocProvider(
                create: (context) => BottomAppBarBloc(),
                child: const BottomAppBarView(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.wrapChip.subPath,
              name: AppRouteNames.wrapChip.name,
              builder: (_, __) => BlocProvider(
                create: (context) =>
                    WrapAndChipBloc(listShape: AppConstant.listShapeOptions),
                child: const WrapAndChipView(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.customBoxShape.subPath,
              name: AppRouteNames.customBoxShape.name,
              builder: (_, __) => const CustomBoxShapeView(),
            ),
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.button.subPath,
              name: AppRouteNames.button.name,
              builder: (_, __) => const ButtonView(),
            ),
            GoRoute(
              parentNavigatorKey: AppCoordinator.navigatorKey,
              path: AppRouteNames.image.subPath,
              name: AppRouteNames.image.name,
              builder: (_, __) => const ImageView(),
            ),
          ]),
    ],
    errorBuilder: (_, __) => Container(),
  );
}
