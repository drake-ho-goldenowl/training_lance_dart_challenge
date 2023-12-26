import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/feature/dashboard/logic/dashboard_state.dart';
import 'package:gallery_app/src/network/model/widget_model.dart';

class DashboardBloc extends Cubit<DashboardState> {
  DashboardBloc(List<AppWidgetModel> listWidgets)
      : super(DashboardState(listWidgets: listWidgets));

  void navigateToWidget() {}
}
