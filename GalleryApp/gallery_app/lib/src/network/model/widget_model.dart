import 'package:flutter/material.dart';

class AppWidgetModel {
  final String title;
  final String subTitle;
  final IconData icon;
  final String? routeName;

  AppWidgetModel(
      {required this.title,
      required this.subTitle,
      required this.icon,
      this.routeName});
}
