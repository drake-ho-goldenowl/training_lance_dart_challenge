import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/feature/dashboard/logic/dashboard_bloc.dart';
import 'package:gallery_app/src/feature/dashboard/logic/dashboard_state.dart';
import 'package:gallery_app/src/network/model/widget_model.dart';
import 'package:gallery_app/src/router/coordinator.dart';
import 'package:gallery_app/widget/app_bar.dart';
import 'package:gallery_app/widget/list_tile.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _renderAppBar(),
          Expanded(child: _renderListWidgetInFlutter())
        ],
      ),
    );
  }

  Widget _renderAppBar() {
    return const XAppBar(
      title: AppString.myWidget,
      actions: [
        Icon(
          Icons.account_circle,
          color: Colors.white,
        ),
        SizedBox(width: AppSize.s15)
      ],
    );
  }

  Widget _renderListWidgetInFlutter() {
    return BlocSelector<DashboardBloc, DashboardState, List<AppWidgetModel>>(
      selector: (state) => state.listWidgets,
      builder: (context, widgets) {
        return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widgets.length,
            itemBuilder: (context, index) => XListTile(
                  leadingIcon: _renderLeadingIconWidget(widgets[index].icon),
                  title: _renderPaddingWidget(widgets[index].title),
                  subTitle: _renderPaddingWidget(widgets[index].subTitle),
                  isEnable: widgets[index].routeName != null,
                  onTapped: () => AppCoordinator.showRichTextView(),
                ));
      },
    );
  }

  Widget _renderLeadingIconWidget(IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [Icon(icon)],
    );
  }

  Widget _renderPaddingWidget(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppPadding.p8, top: AppPadding.p0, right: AppPadding.p16),
      child: Text(title),
    );
  }
}
