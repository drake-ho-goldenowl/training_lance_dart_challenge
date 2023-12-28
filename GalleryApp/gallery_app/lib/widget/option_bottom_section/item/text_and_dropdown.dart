import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';

class AppTextWithDropdown<T> extends StatelessWidget {
  const AppTextWithDropdown(
      {super.key,
      this.label,
      required this.value,
      this.labelStyle = const TextStyle(fontSize: AppFontSize.f16),
      this.onChanged,
      this.listValue, this.onTapped});
  final String? label;
  final TextStyle labelStyle;
  final List<DropdownMenuItem<T>>? listValue;
  final T value;
  final void Function(T)? onChanged;
  final void Function(T)? onTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        label != null ? Text(
          label!,
          style: labelStyle,
        ) : const SizedBox.shrink(),
        DropdownButton(
          items: listValue,
          value: value,
          onTap: () => onTapped?.call(value),
          onChanged: (value) => onChanged?.call(value as T),
        )
      ],
    );
  }
}
