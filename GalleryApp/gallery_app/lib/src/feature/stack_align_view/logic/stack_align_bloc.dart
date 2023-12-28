import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/feature/stack_align_view/logic/stack_align_state.dart';

class StackAlignBloc extends Cubit<StackAlignState> {
  StackAlignBloc({
    required List<DropdownMenuItem<Alignment>> listAlignmentOptions,
    required List<DropdownMenuItem<StackFit>> listStackFitOptions,
    required List<DropdownMenuItem<Clip>> listClipOptions,
    required List<DropdownMenuItem<TextDirection>> listTextDirectionOptions,
  }) : super(StackAlignState(
          listAlignmentOptions: listAlignmentOptions,
          listStackFitOptions: listStackFitOptions,
          listClipOptions: listClipOptions,
          listTextDirectionOptions: listTextDirectionOptions,
        ));

  void changeOptionClip(Clip clip) {
    emit(state.copyWith(clip: clip));
  }

  void changeOptionStackFit(StackFit stackFit) {
    emit(state.copyWith(stackFit: stackFit));
  }

  void changeOptionAlignment(Alignment alignment) {
    emit(state.copyWith(alignment: alignment));
  }

  void changeOptionTextDirection(TextDirection textDirection) {
    emit(state.copyWith(textDirection: textDirection));
  }
}
