import 'package:flutter/material.dart';

class StackAlignState {
  StackAlignState(
      {this.alignment = Alignment.center,
      this.textDirection = TextDirection.ltr,
      this.stackFit = StackFit.loose,
      this.clip = Clip.hardEdge,
      required this.listAlignmentOptions,
      required this.listStackFitOptions,
      required this.listClipOptions,
      required this.listTextDirectionOptions});

  final Alignment alignment;
  final TextDirection textDirection;
  final StackFit stackFit;
  final Clip clip;

  //List const value
  final List<DropdownMenuItem<Alignment>> listAlignmentOptions;
  final List<DropdownMenuItem<StackFit>> listStackFitOptions;
  final List<DropdownMenuItem<Clip>> listClipOptions;
  final List<DropdownMenuItem<TextDirection>> listTextDirectionOptions;
  StackAlignState copyWith(
      {Alignment? alignment,
      TextDirection? textDirection,
      StackFit? stackFit,
      Clip? clip,
      List<DropdownMenuItem<Alignment>>? listAlignmentOptions,
      List<DropdownMenuItem<StackFit>>? listStackFitOptions,
      List<DropdownMenuItem<Clip>>? listClipOptions,
      List<DropdownMenuItem<TextDirection>>? listTextDirectionOptions}) {
    return StackAlignState(
        alignment: alignment ?? this.alignment,
        textDirection: textDirection ?? this.textDirection,
        stackFit: stackFit ?? this.stackFit,
        clip: clip ?? this.clip,
        listAlignmentOptions: listAlignmentOptions ?? this.listAlignmentOptions,
        listStackFitOptions: listStackFitOptions ?? this.listStackFitOptions,
        listClipOptions: listClipOptions ?? this.listClipOptions,
        listTextDirectionOptions:
            listTextDirectionOptions ?? this.listTextDirectionOptions);
  }
}
