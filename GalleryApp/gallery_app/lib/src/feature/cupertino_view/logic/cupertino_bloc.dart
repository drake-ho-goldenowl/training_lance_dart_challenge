import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/feature/cupertino_view/logic/cupertino_state.dart';

class CupertinoBloc extends Cubit<CupertinoState> {
  CupertinoBloc() : super(CupertinoState());

  void changeSwitchValue(bool value) {
    emit(state.copyWith(switchValue: value));
  }

  void changeSliderValue(double value) {
    emit(state.copyWith(sliderValue: value));
  }

  void pullToRefresh(bool isRefresh) {
    emit(state.copyWith(sliderValue: 0.0, switchValue: false));
  }
}
