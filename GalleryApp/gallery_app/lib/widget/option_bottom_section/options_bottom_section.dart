import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';

class AppOptionBottomSection extends StatelessWidget {
  const AppOptionBottomSection({super.key, required this.options});
  final List<Widget> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(spreadRadius: 1.0, blurRadius: 2.0),
        ],
      ),
      child: Column(
        children: options,
      ),
    );
  }
}
