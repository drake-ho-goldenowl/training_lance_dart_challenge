import 'package:flutter/material.dart';

class ContainerState {
  final bool isShowBorder;
  final bool isShowBoxShadow;
  final double borderRadius;
  final List<DropdownMenuItem<double>> listBorderRadiusOptions;
  final MaterialColor background;
  final List<DropdownMenuItem<MaterialColor>> listBackGrColorOptions;
  final BlendMode blendMode;
  final List<DropdownMenuItem<BlendMode>> listBlendModeOptions;

  ContainerState({
    this.isShowBorder = false,
    this.isShowBoxShadow = false,
    this.borderRadius = 0.0,
    this.background = Colors.blue,
    this.blendMode = BlendMode.src,
    required this.listBorderRadiusOptions,
    required this.listBackGrColorOptions,
    required this.listBlendModeOptions,
  });

  ContainerState copyWith({
    bool? isShowBorder,
    bool? isShowBoxShadow,
    double? borderRadius,
    List<DropdownMenuItem<double>>? listBorderRadiusOptions,
    MaterialColor? background,
    List<DropdownMenuItem<MaterialColor>>? listBackGrColorOptions,
    BlendMode? blendMode,
    List<DropdownMenuItem<BlendMode>>? listBlendModeOptions,
  }) {
    return ContainerState(
      isShowBorder: isShowBorder ?? this.isShowBorder,
      isShowBoxShadow: isShowBoxShadow ?? this.isShowBoxShadow,
      borderRadius: borderRadius ?? this.borderRadius,
      background: background ?? this.background,
      blendMode: blendMode ?? this.blendMode,
      listBackGrColorOptions:
          listBackGrColorOptions ?? this.listBackGrColorOptions,
      listBlendModeOptions: listBlendModeOptions ?? this.listBlendModeOptions,
      listBorderRadiusOptions:
          listBorderRadiusOptions ?? this.listBorderRadiusOptions,
    );
  }
}
