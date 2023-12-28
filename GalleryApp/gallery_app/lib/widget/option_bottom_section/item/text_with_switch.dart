import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';

class AppTextWithSwitch extends StatelessWidget {
  const AppTextWithSwitch(
      {super.key,
      required this.label,
      required this.value,
      this.labelStyle = const TextStyle(fontSize: AppFontSize.f16),
      this.onChanged});
  final String label;
  final TextStyle labelStyle;
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: labelStyle,
        ),
        Switch(
          activeColor: Colors.blue,
          value: value,
          onChanged: onChanged,
        )
      ],
    );
  }
}
