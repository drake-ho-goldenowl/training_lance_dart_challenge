import 'package:flutter/material.dart';

class WrapAndChipState {
  WrapAndChipState(
      {this.isShowElevation = false,
      this.isShowAvatar = false,
      this.isShowDeleteIcon = false,
      this.shape = const StadiumBorder(),
      required this.listShape,
      this.isSpacing = true,
      this.isRunSpacing = true});

  final bool isShowElevation;
  final bool isShowAvatar;
  final bool isShowDeleteIcon;
  final OutlinedBorder shape;
  final List<DropdownMenuItem<OutlinedBorder>> listShape;
  final bool isSpacing;
  final bool isRunSpacing;
  WrapAndChipState copyWith(
      {bool? isShowElevation,
      bool? isShowAvatar,
      bool? isShowDeleteIcon,
      OutlinedBorder? shape,
      List<DropdownMenuItem<OutlinedBorder>>? listShape,
      bool? isSpacing,
      bool? isRunSpacing}) {
    return WrapAndChipState(
        isShowElevation: isShowElevation ?? this.isShowElevation,
        isShowAvatar: isShowAvatar ?? this.isShowAvatar,
        isShowDeleteIcon: isShowDeleteIcon ?? this.isShowDeleteIcon,
        shape: shape ?? this.shape,
        listShape: listShape ?? this.listShape,
        isSpacing: isSpacing ?? this.isSpacing,
        isRunSpacing: isRunSpacing ?? this.isRunSpacing);
  }
}
