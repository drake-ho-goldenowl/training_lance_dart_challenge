import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/network/model/widget_model.dart';
import 'package:gallery_app/src/router/route_name.dart';

class AppConstant {
  static final listWidgetFlutter = [
    AppWidgetModel(
      title: AppString.curpertino,
      subTitle: AppString.beautifulAndHighFidelity,
      icon: Icons.phone_iphone_outlined,
    ),
    AppWidgetModel(
      title: AppString.richText,
      subTitle: AppString.awidgetDisplaysText,
      icon: Icons.text_format_outlined,
      routeName: AppRouteNames.richText.name,
    ),
    AppWidgetModel(
        title: AppString.typography,
        subTitle: AppString.allOfThePredefined,
        icon: Icons.text_fields_outlined),
    AppWidgetModel(
        title: AppString.bottomAppBar,
        subTitle: AppString.bottomApplicationBar,
        icon: Icons.menu),
    AppWidgetModel(
        title: AppString.button,
        subTitle: AppString.raisedButtonFlatButton,
        icon: Icons.web),
    AppWidgetModel(
        title: AppString.list,
        subTitle: AppString.scrollingListLayout,
        icon: Icons.format_list_bulleted),
    AppWidgetModel(
        title: AppString.card,
        subTitle: AppString.cardsWithRoundedCorners,
        icon: Icons.chrome_reader_mode),
    AppWidgetModel(
        title: AppString.listTitle,
        subTitle: AppString.asingleFixedHeight,
        icon: Icons.format_list_bulleted),
    AppWidgetModel(
        title: AppString.alert,
        subTitle: AppString.alertsSnackBarTooltip,
        icon: Icons.tab_unselected_sharp),
    AppWidgetModel(
        title: AppString.textField,
        subTitle: AppString.textFieldTextFieldForm,
        icon: Icons.menu),
    AppWidgetModel(
        title: AppString.rowColumn,
        subTitle: AppString.awidgetThatDisplaysIts,
        icon: Icons.multitrack_audio_sharp),
    AppWidgetModel(
        title: AppString.wrapChip,
        subTitle: AppString.wrapChip,
        icon: Icons.edit_attributes),
  ];
}
