import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';

class AppTextWithDropdown<T> extends StatelessWidget {
  const AppTextWithDropdown(
      {super.key,
      this.label,
      this.value,
      this.labelStyle = const TextStyle(fontSize: AppFontSize.f16),
      this.onChanged,
      this.listValue,
      this.onTapped,
      this.hintText});
  final String? label;
  final TextStyle labelStyle;
  final List<DropdownMenuItem<T>>? listValue;
  final T? value;
  final void Function(T)? onChanged;
  final void Function(T)? onTapped;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        label != null
            ? Expanded(
                child: Text(
                  label!,
                  style: labelStyle,
                ),
              )
            : const SizedBox.shrink(),
        DropdownButton(
          items: listValue,
          value: value,
          hint: hintText == null
              ? null
              : Text(
                  hintText!,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
          onTap: () => onTapped?.call(value as T),
          onChanged: (value) => onChanged?.call(value as T),
        )
      ],
    );
  }
}
