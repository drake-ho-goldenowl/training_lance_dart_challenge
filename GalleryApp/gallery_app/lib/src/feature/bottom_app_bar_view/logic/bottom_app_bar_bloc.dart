import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/feature/bottom_app_bar_view/logic/bottom_app_bar_state.dart';

class BottomAppBarBloc extends Cubit<BottomAppBarState> {
  BottomAppBarBloc() : super(BottomAppBarState());

  void showHideFloatingButton(bool isShow) {
    emit(state.copyWith(isShowFloatButton: isShow));
  }

  void changeNotchOptions(bool hasNotch) {
    emit(state.copyWith(hasNotch: hasNotch));
  }

  void changeButtonPosition(FloatingActionButtonLocation position) {
    emit(state.copyWith(buttonLocation: position));
  }
}
