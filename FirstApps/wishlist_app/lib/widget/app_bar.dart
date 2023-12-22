import 'package:flutter/material.dart';
import 'package:wishlist_app/src/config/constants/value_manager.dart';

class XAppBar extends StatelessWidget {
  const XAppBar(
      {super.key,
      required this.title,
      this.titleStyle = const TextStyle(
          color: Colors.black,
          fontSize: SizeApp.s20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
      this.leading,
      this.actions});
  final String title;
  final TextStyle titleStyle;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      titleTextStyle: titleStyle,
      leading: leading,
      actions: actions,
    );
  }
}
