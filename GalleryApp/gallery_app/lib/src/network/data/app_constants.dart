import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/feature/row_column_view/logic/row_column_state.dart';
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
      title: AppString.container,
      subTitle: AppString.aconvenienceWidgetThatCombines,
      icon: Icons.filter_frames,
      routeName: AppRouteNames.container.name,
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
        routeName: AppRouteNames.rowColumn.name,
        icon: Icons.multitrack_audio_sharp),
    AppWidgetModel(
        title: AppString.wrapChip,
        subTitle: AppString.wrapChip,
        icon: Icons.edit_attributes),
  ];

  static final listBorderRadiusOptions = [
    const DropdownMenuItem(
      value: 0.0,
      child: Text('None'),
    ),
    const DropdownMenuItem(
      value: 2.0,
      child: Text('2.0'),
    ),
    const DropdownMenuItem(
      value: 4.0,
      child: Text('4.0'),
    ),
    const DropdownMenuItem(
      value: 8.0,
      child: Text('8.0'),
    ),
    const DropdownMenuItem(
      value: 12.0,
      child: Text('12.0'),
    ),
    const DropdownMenuItem(
      value: 15.0,
      child: Text('15.0'),
    ),
  ];

  static final listBackgroundColorOptions = [
    const DropdownMenuItem(
      value: Colors.blue,
      child: Text(AppString.color),
    ),
    const DropdownMenuItem(
      value: Colors.red,
      child: Text('Red'),
    ),
    const DropdownMenuItem(
      value: Colors.yellow,
      child: Text('Yellow'),
    ),
    const DropdownMenuItem(
      value: Colors.orange,
      child: Text('Orange'),
    ),
    const DropdownMenuItem(
      value: Colors.green,
      child: Text('Green'),
    ),
    const DropdownMenuItem(
      value: Colors.purple,
      child: Text('Purple'),
    ),
  ];

  static final listBlendModeContainerOptions = [
    const DropdownMenuItem(
      value: BlendMode.src,
      child: Text('src'),
    ),
    const DropdownMenuItem(
      value: BlendMode.dst,
      child: Text('dst'),
    ),
    const DropdownMenuItem(
      value: BlendMode.xor,
      child: Text('xor'),
    ),
    const DropdownMenuItem(
      value: BlendMode.screen,
      child: Text('screen'),
    ),
    const DropdownMenuItem(
      value: BlendMode.lighten,
      child: Text('lighten'),
    ),
    const DropdownMenuItem(
      value: BlendMode.darken,
      child: Text('darken'),
    ),
  ];

  static final listMode = [RowColumnMode.row, RowColumnMode.column];

  static final listMainAxisSizeOptions = [
    const DropdownMenuItem(
      value: MainAxisSize.max,
      child: Text('max'),
    ),
    const DropdownMenuItem(
      value: MainAxisSize.min,
      child: Text('min'),
    ),
  ];

  static final listMainAxisAligmentOptions = [
    const DropdownMenuItem(
      value: MainAxisAlignment.start,
      child: Text('start'),
    ),
    const DropdownMenuItem(
      value: MainAxisAlignment.end,
      child: Text('end'),
    ),
    const DropdownMenuItem(
      value: MainAxisAlignment.center,
      child: Text('center'),
    ),
    const DropdownMenuItem(
      value: MainAxisAlignment.spaceAround,
      child: Text('spaceAround'),
    ),
    const DropdownMenuItem(
      value: MainAxisAlignment.spaceBetween,
      child: Text('spaceBetween'),
    ),
    const DropdownMenuItem(
      value: MainAxisAlignment.spaceEvenly,
      child: Text('spaceEvenly'),
    ),
  ];

  static final listCrossAxisSizeOptions = [
    const DropdownMenuItem(
      value: CrossAxisAlignment.center,
      child: Text('center'),
    ),
    const DropdownMenuItem(
      value: CrossAxisAlignment.start,
      child: Text('start'),
    ),
    const DropdownMenuItem(
      value: CrossAxisAlignment.end,
      child: Text('end'),
    ),
    const DropdownMenuItem(
      value: CrossAxisAlignment.baseline,
      child: Text('baseline'),
    ),
    const DropdownMenuItem(
      value: CrossAxisAlignment.stretch,
      child: Text('stretch'),
    ),
  ];

  static final listVerticalDirectionOptions = [
    const DropdownMenuItem(
      value: VerticalDirection.down,
      child: Text('down'),
    ),
    const DropdownMenuItem(
      value: VerticalDirection.up,
      child: Text('up'),
    ),
  ];

  static final listTextDirectionOptions = [
    const DropdownMenuItem(
      value: TextDirection.ltr,
      child: Text('ltr'),
    ),
    const DropdownMenuItem(
      value: TextDirection.rtl,
      child: Text('rtl'),
    ),
  ];

  static final listTextBaselineOptions = [
    const DropdownMenuItem(
      value: TextBaseline.ideographic,
      child: Text('ideographic'),
    ),
    const DropdownMenuItem(
      value: TextBaseline.alphabetic,
      child: Text('alphabetic'),
    ),
  ];
}
