import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/feature/wrap_chip_view/logic/wrap_chip_state.dart';

class WrapAndChipBloc extends Cubit<WrapAndChipState> {
  WrapAndChipBloc({required List<DropdownMenuItem<OutlinedBorder>> listShape})
      : super(WrapAndChipState(listShape: listShape));

  void showElevation(bool isShow) {
    emit(state.copyWith(isShowElevation: isShow));
  }

  void showAvatar(bool isShow) {
    emit(state.copyWith(isShowAvatar: isShow));
  }

  void showDeleteIcon(bool isShow) {
    emit(state.copyWith(isShowDeleteIcon: isShow));
  }

  void showSpacing(bool isShow) {
    emit(state.copyWith(isSpacing: isShow));
  }

  void showRunSpacing(bool isShow) {
    emit(state.copyWith(isRunSpacing: isShow));
  }

  void changeShapeOfChip(OutlinedBorder shape) {
    emit(state.copyWith(shape: shape));
  }
}
