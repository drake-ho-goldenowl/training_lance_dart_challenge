import 'package:equatable/equatable.dart';
import 'package:gallery_app/src/network/model/widget_model.dart';

class DashboardState extends Equatable {
  const DashboardState({
    required this.listWidgets,
  });
  final List<AppWidgetModel> listWidgets;

  DashboardState copyWith({List<AppWidgetModel>? listWidgets}) {
    return DashboardState(listWidgets: listWidgets ?? this.listWidgets);
  }

  @override
  List<Object?> get props => [listWidgets];
}
