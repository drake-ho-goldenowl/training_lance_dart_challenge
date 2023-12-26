import 'package:flutter/material.dart';

class XListTile extends StatelessWidget {
  const XListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.titleStyle,
    required this.subTitle,
    required this.subTitleStyle,
    this.isShowFooterLine = true,
  });

  final Widget leadingIcon;
  final String title;
  final TextStyle titleStyle;
  final String subTitle;
  final TextStyle subTitleStyle;
  final bool isShowFooterLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: leadingIcon,
          title: Text(
            title,
            style: titleStyle,
          ),
          subtitle: Text(
            subTitle,
            style: subTitleStyle,
          ),
        )
      ],
    );
  }
}
