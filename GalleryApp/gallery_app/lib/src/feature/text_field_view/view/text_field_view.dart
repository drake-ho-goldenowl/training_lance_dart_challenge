import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/feature/text_field_view/logic/text_field_bloc.dart';
import 'package:gallery_app/src/feature/text_field_view/logic/text_field_state.dart';
import 'package:gallery_app/src/router/coordinator.dart';
import 'package:gallery_app/widget/app_bar.dart';
import 'package:gallery_app/widget/option_bottom_section/item/text_with_switch.dart';

class TextFieldView extends StatelessWidget {
  const TextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: false,
        primaryTextTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: AppFontSize.f20,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w900)),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey[400],
        body: SingleChildScrollView(
          child: Column(
            children: [_renderAppBar(), _renderBody(context)],
          ),
        ),
      ),
    );
  }

  Widget _renderAppBar() {
    return XAppBar(
      title: AppString.formView,
      leading: IconButton(
        onPressed: () => AppCoordinator.showDashboardScreen(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _renderBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        children: [_renderFormOptions(), _renderFormSample()],
      ),
    );
  }

  Widget _renderFormOptions() {
    return Column(
      children: [
        _renderHintTextOption(),
        _renderLabelTextOption(),
        _renderHelpTextOption(),
        _renderErrorTextOption(),
        _renderCounterTextOption(),
        _renderPrefixOption(),
        _renderSuffixOption(),
        _renderPrefixIconOption(),
      ],
    );
  }

  Widget _renderHintTextOption() {
    return BlocSelector<TextFieldBloc, TextFieldState, bool>(
      selector: (state) => state.isShowHint,
      builder: (context, state) {
        return AppTextWithSwitch(
          label: AppString.hintText,
          value: state,
          onChanged: (value) =>
              context.read<TextFieldBloc>().changeOptionHintText(value),
        );
      },
    );
  }

  Widget _renderLabelTextOption() {
    return BlocSelector<TextFieldBloc, TextFieldState, bool>(
      selector: (state) => state.isShowLabel,
      builder: (context, state) {
        return AppTextWithSwitch(
          label: AppString.labelText,
          value: state,
          onChanged: (value) =>
              context.read<TextFieldBloc>().changeOptionLabelText(value),
        );
      },
    );
  }

  Widget _renderErrorTextOption() {
    return BlocSelector<TextFieldBloc, TextFieldState, bool>(
      selector: (state) => state.isShowError,
      builder: (context, state) {
        return AppTextWithSwitch(
          label: AppString.errorText,
          value: state,
          onChanged: (value) =>
              context.read<TextFieldBloc>().changeOptionErrorText(value),
        );
      },
    );
  }

  Widget _renderHelpTextOption() {
    return BlocSelector<TextFieldBloc, TextFieldState, bool>(
      selector: (state) => state.isShowHelp,
      builder: (context, state) {
        return AppTextWithSwitch(
          label: AppString.helpText,
          value: state,
          onChanged: (value) =>
              context.read<TextFieldBloc>().changeOptionHelpText(value),
        );
      },
    );
  }

  Widget _renderCounterTextOption() {
    return BlocSelector<TextFieldBloc, TextFieldState, bool>(
      selector: (state) => state.isShowCounter,
      builder: (context, state) {
        return AppTextWithSwitch(
          label: AppString.counterText,
          value: state,
          onChanged: (value) =>
              context.read<TextFieldBloc>().changeOptionCounterText(value),
        );
      },
    );
  }

  Widget _renderPrefixOption() {
    return BlocSelector<TextFieldBloc, TextFieldState, bool>(
      selector: (state) => state.isShowPrefix,
      builder: (context, state) {
        return AppTextWithSwitch(
          label: AppString.prefix,
          value: state,
          onChanged: (value) =>
              context.read<TextFieldBloc>().changeOptionPreffix(value),
        );
      },
    );
  }

  Widget _renderPrefixIconOption() {
    return BlocSelector<TextFieldBloc, TextFieldState, bool>(
      selector: (state) => state.isShowPrefixIcon,
      builder: (context, state) {
        return AppTextWithSwitch(
          label: AppString.prefixIcon,
          value: state,
          onChanged: (value) =>
              context.read<TextFieldBloc>().changeOptionPrefixIcon(value),
        );
      },
    );
  }

  Widget _renderSuffixOption() {
    return BlocSelector<TextFieldBloc, TextFieldState, bool>(
      selector: (state) => state.isShowSuffix,
      builder: (context, state) {
        return AppTextWithSwitch(
          label: AppString.suffix,
          value: state,
          onChanged: (value) =>
              context.read<TextFieldBloc>().changeOptionSuffix(value),
        );
      },
    );
  }

  Widget _renderFormSample() {
    return Center(
      child: BlocBuilder<TextFieldBloc, TextFieldState>(
        builder: (context, state) {
          return Column(
            children: [
              _renderStandardTextField(context, state),
              const SizedBox(
                height: AppPadding.p16,
              ),
              _renderOutlinedBorderTextField(context, state),
            ],
          );
        },
      ),
    );
  }

  Widget _renderStandardTextField(BuildContext context, TextFieldState state) {
    return TextField(
      onChanged: (value) => context.read<TextFieldBloc>().onChangedInput(value),
      decoration: InputDecoration(
        prefix: state.isShowPrefix ? const Text(AppString.prefix) : null,
        prefixIcon: state.isShowPrefixIcon ? const Icon(Icons.key) : null,
        suffixIcon: state.isShowSuffix ? const Icon(Icons.security) : null,
        labelText: state.isShowLabel ? AppString.labelText : null,
        hintText: state.isShowHint ? AppString.hintText : null,
        helperText: state.isShowHelp ? AppString.helpText : null,
        errorText: state.isShowError ? AppString.errorText : null,
        counterText:
            state.isShowCounter ? "${(state.input ?? '').length}/16" : null,
      ),
    );
  }

  Widget _renderOutlinedBorderTextField(
      BuildContext context, TextFieldState state) {
    return TextField(
      onChanged: (value) => context.read<TextFieldBloc>().onChangedInput(value),
      decoration: InputDecoration(
          prefix: state.isShowPrefix ? const Text(AppString.prefix) : null,
          prefixIcon: state.isShowPrefixIcon ? const Icon(Icons.key) : null,
          suffixIcon: state.isShowSuffix ? const Icon(Icons.security) : null,
          labelText: state.isShowLabel ? AppString.labelText : null,
          hintText: state.isShowHint ? AppString.hintText : null,
          helperText: state.isShowHelp ? AppString.helpText : null,
          errorText: state.isShowError ? AppString.errorText : null,
          counterText:
              state.isShowCounter ? "${(state.input ?? '').length}/16" : null,
          border: const OutlineInputBorder()),
    );
  }
}
