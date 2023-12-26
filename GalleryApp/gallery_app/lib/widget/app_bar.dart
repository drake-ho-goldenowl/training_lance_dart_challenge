import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';

class XAppBar extends StatelessWidget {
  const XAppBar(
      {super.key,
      required this.title,
      this.bgColor = Colors.blue,
      this.titleStyle = const TextStyle(
          color: Colors.white,
          fontSize: AppSize.s30,
          fontWeight: FontWeight.bold),
      this.leading,
      this.actions});
  final String title;
  final TextStyle titleStyle;
  final Widget? leading;
  final List<Widget>? actions;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      title: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          child: Text(title)),
      centerTitle: false,
      titleTextStyle: titleStyle,
      leading: leading,
      actions: actions,
    );
  }
}
