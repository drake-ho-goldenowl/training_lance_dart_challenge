import 'package:flutter/material.dart';

enum RowColumnMode { row, column }

class RowColumnState {
  RowColumnState(
      {this.mode = RowColumnMode.row,
      this.mainAxisSize = MainAxisSize.max,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.verticalDirection = VerticalDirection.down,
      this.textDirection = TextDirection.ltr,
      this.textBaseline = TextBaseline.ideographic,
      required this.listMainAxisSizeOptions,
      required this.listMainAxisAlignmentOptions,
      required this.listCrossAxisAlignmentOptions,
      required this.listVerticalDirectionOptions,
      required this.listTextDirectionOptions,
      required this.listTextBaselineOptions});

  final RowColumnMode mode;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection textDirection;
  final TextBaseline textBaseline;

  //List const value
  final List<DropdownMenuItem<MainAxisSize>> listMainAxisSizeOptions;
  final List<DropdownMenuItem<MainAxisAlignment>> listMainAxisAlignmentOptions;
  final List<DropdownMenuItem<CrossAxisAlignment>>
      listCrossAxisAlignmentOptions;
  final List<DropdownMenuItem<VerticalDirection>> listVerticalDirectionOptions;
  final List<DropdownMenuItem<TextDirection>> listTextDirectionOptions;
  final List<DropdownMenuItem<TextBaseline>> listTextBaselineOptions;

  RowColumnState copyWith(
      {RowColumnMode? mode,
      MainAxisSize? mainAxisSize,
      MainAxisAlignment? mainAxisAlignment,
      CrossAxisAlignment? crossAxisAlignment,
      VerticalDirection? verticalDirection,
      TextDirection? textDirection,
      TextBaseline? textBaseline,
      List<DropdownMenuItem<MainAxisSize>>? listMainAxisSizeOptions,
      List<DropdownMenuItem<MainAxisAlignment>>? listMainAxisAlignmentOptions,
      List<DropdownMenuItem<CrossAxisAlignment>>? listCrossAxisAlignmentOptions,
      List<DropdownMenuItem<VerticalDirection>>? listVerticalDirectionOptions,
      List<DropdownMenuItem<TextDirection>>? listTextDirectionOptions,
      List<DropdownMenuItem<TextBaseline>>? listTextBaselineOptions}) {
    return RowColumnState(
        mode: mode ?? this.mode,
        mainAxisSize: mainAxisSize ?? this.mainAxisSize,
        mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
        verticalDirection: verticalDirection ?? this.verticalDirection,
        textDirection: textDirection ?? this.textDirection,
        textBaseline: textBaseline ?? this.textBaseline,
        listMainAxisSizeOptions:
            listMainAxisSizeOptions ?? this.listMainAxisSizeOptions,
        listMainAxisAlignmentOptions:
            listMainAxisAlignmentOptions ?? this.listMainAxisAlignmentOptions,
        listCrossAxisAlignmentOptions:
            listCrossAxisAlignmentOptions ?? this.listCrossAxisAlignmentOptions,
        listVerticalDirectionOptions:
            listVerticalDirectionOptions ?? this.listVerticalDirectionOptions,
        listTextDirectionOptions:
            listTextDirectionOptions ?? this.listTextDirectionOptions,
        listTextBaselineOptions:
            listTextBaselineOptions ?? this.listTextBaselineOptions);
  }
}
