import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/feature/container_view/logic/container_state.dart';

class ContainerBloc extends Cubit<ContainerState> {
  ContainerBloc({
    required List<DropdownMenuItem<double>> listBorderRadiusOptions,
    required List<DropdownMenuItem<MaterialColor>> listBackGrColorOptions,
    required List<DropdownMenuItem<BlendMode>> listBlendModeOptions,
  }) : super(ContainerState(
          listBackGrColorOptions: listBackGrColorOptions,
          listBlendModeOptions: listBlendModeOptions,
          listBorderRadiusOptions: listBorderRadiusOptions,
        ));

  void changeOptionShowBorder(bool isShow) {
    emit(state.copyWith(isShowBorder: isShow));
  }

  void changeOptionBorderRadius(double radius) {
    emit(state.copyWith(borderRadius: radius));
  }

  void changeOptionShowBoxShadow(bool isShow) {
    emit(state.copyWith(isShowBoxShadow: isShow));
  }

  void changeOptionBackGroundColor(MaterialColor color) {
    emit(state.copyWith(background: color));
  }

  void changeOptionBlendMode(BlendMode mode) {
    emit(state.copyWith(blendMode: mode));
  }
}
