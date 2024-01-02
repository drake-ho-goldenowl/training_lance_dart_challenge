import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/feature/text_field_view/logic/text_field_state.dart';

class TextFieldBloc extends Cubit<TextFieldState> {
  TextFieldBloc() : super(TextFieldState());

  void changeOptionHintText(bool isShow) {
    emit(state.copyWith(isShowHint: isShow));
  }

  void changeOptionLabelText(bool isShow) {
    emit(state.copyWith(isShowLabel: isShow));
  }

  void changeOptionErrorText(bool isShow) {
    emit(state.copyWith(isShowError: isShow));
  }

  void changeOptionCounterText(bool isShow) {
    emit(state.copyWith(isShowCounter: isShow));
  }

  void changeOptionHelpText(bool isShow) {
    emit(state.copyWith(isShowHelp: isShow));
  }

  void changeOptionPreffix(bool isShow) {
    emit(state.copyWith(isShowPrefix: isShow));
  }

  void changeOptionSuffix(bool isShow) {
    emit(state.copyWith(isShowSuffix: isShow));
  }

  void changeOptionPrefixIcon(bool isShow) {
    emit(state.copyWith(isShowPrefixIcon: isShow));
  }

  void onChangedInput(String input) {
    emit(state.copyWith(input: input));
  }
}
