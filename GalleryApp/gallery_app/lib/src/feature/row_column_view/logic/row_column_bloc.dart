import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/feature/row_column_view/logic/row_column_state.dart';

class RowColumnBloc extends Cubit<RowColumnState> {
  RowColumnBloc({
    required List<DropdownMenuItem<MainAxisSize>> listMainAxisSizeOptions,
    required List<DropdownMenuItem<MainAxisAlignment>>
        listMainAxisAlignmentOptions,
    required List<DropdownMenuItem<CrossAxisAlignment>>
        listCrossAxisAlignmentOptions,
    required List<DropdownMenuItem<VerticalDirection>>
        listVerticalDirectionOptions,
    required List<DropdownMenuItem<TextDirection>> listTextDirectionOptions,
    required List<DropdownMenuItem<TextBaseline>> listTextBaselineOptions,
  }) : super(RowColumnState(
          listMainAxisSizeOptions: listMainAxisSizeOptions,
          listMainAxisAlignmentOptions: listMainAxisAlignmentOptions,
          listCrossAxisAlignmentOptions: listCrossAxisAlignmentOptions,
          listVerticalDirectionOptions: listVerticalDirectionOptions,
          listTextDirectionOptions: listTextDirectionOptions,
          listTextBaselineOptions: listTextBaselineOptions,
        ));

  void changeMode(RowColumnMode mode) {
    emit(state.copyWith(mode: mode));
  }

  void changeOptionMainAxisSize(MainAxisSize mainAxisSize) {
    emit(state.copyWith(mainAxisSize: mainAxisSize));
  }

  void changeOptionMainAxisAlignment(MainAxisAlignment mainAxisAlignment) {
    emit(state.copyWith(mainAxisAlignment: mainAxisAlignment));
  }

  void changeOptionCrossAxisAlignment(CrossAxisAlignment crossAxisAlignment) {
    emit(state.copyWith(crossAxisAlignment: crossAxisAlignment));
  }

  void changeOptionVerticalDirection(VerticalDirection verticalDirection) {
    emit(state.copyWith(verticalDirection: verticalDirection));
  }

  void changeOptionTextDirection(TextDirection textDirection) {
    emit(state.copyWith(textDirection: textDirection));
  }

  void changeOptionTextBaseline(TextBaseline textBaseline) {
    emit(state.copyWith(textBaseline: textBaseline));
  }
}
