import 'package:flutter/material.dart';

class BottomAppBarState {
  BottomAppBarState(
      {this.buttonLocation = FloatingActionButtonLocation.endDocked,
      this.isShowFloatButton = true,
      this.hasNotch = true});

  final FloatingActionButtonLocation buttonLocation;
  final bool isShowFloatButton;
  final bool hasNotch;
  BottomAppBarState copyWith(
      {FloatingActionButtonLocation? buttonLocation,
      bool? isShowFloatButton,
      bool? hasNotch}) {
    return BottomAppBarState(
        buttonLocation: buttonLocation ?? this.buttonLocation,
        isShowFloatButton: isShowFloatButton ?? this.isShowFloatButton,
        hasNotch: hasNotch ?? this.hasNotch);
  }
}
