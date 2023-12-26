import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';

class XListTile extends StatelessWidget {
  const XListTile(
      {super.key,
      required this.leadingIcon,
      required this.title,
      this.titleStyle = const TextStyle(
          fontSize: AppFontSize.f20,
          color: Colors.black,
          fontWeight: FontWeight.w500),
      required this.subTitle,
      this.subTitleStyle =
          const TextStyle(fontSize: AppFontSize.f16, color: Colors.grey),
      this.isShowFooterLine = true,
      this.iconColor = Colors.grey});

  final Widget leadingIcon;
  final Widget title;
  final TextStyle titleStyle;
  final Widget subTitle;
  final TextStyle subTitleStyle;
  final bool isShowFooterLine;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: AppPadding.p16, top: 0),
      leading: leadingIcon,
      title: title,
      iconColor: iconColor,
      subtitle: _renderSubTitle(),
      titleTextStyle: titleStyle,
      subtitleTextStyle: subTitleStyle,
      minVerticalPadding: AppPadding.p0,
    );
  }

  Widget _renderSubTitle() {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: AppSize.s42),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [subTitle, const Divider()],
      ),
    );
  }
}
