import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/feature/stack_align_view/logic/stack_align_bloc.dart';
import 'package:gallery_app/src/feature/stack_align_view/logic/stack_align_state.dart';
import 'package:gallery_app/src/router/coordinator.dart';
import 'package:gallery_app/widget/app_bar.dart';
import 'package:gallery_app/widget/option_bottom_section/item/text_and_dropdown.dart';
import 'package:gallery_app/widget/option_bottom_section/options_bottom_section.dart';

class StackAlignView extends StatelessWidget {
  const StackAlignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_renderAppBar(), Expanded(child: _renderBody(context))],
      ),
    );
  }

  Widget _renderAppBar() {
    return XAppBar(
      title: AppString.stackAlign,
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
    return Column(
      children: [_renderStackAlignSample(), _renderRowColumnOptions()],
    );
  }

  Widget _renderStackAlignSample() {
    return Expanded(child: BlocBuilder<StackAlignBloc, StackAlignState>(
      builder: (context, state) {
        return Stack(
          alignment: state.alignment,
          clipBehavior: state.clip,
          textDirection: state.textDirection,
          fit: state.stackFit,
          children: [
            _renderBlueContainer(),
            _renderGreenContainer(),
            _renderOrangeContainer(),
          ],
        );
      },
    ));
  }

  Widget _renderBlueContainer() {
    return Container(
      color: Colors.blue,
      width: AppSize.s200,
      height: AppSize.s200,
    );
  }

  Widget _renderGreenContainer() {
    return Container(
      color: Colors.green,
      width: AppSize.s125,
      height: AppSize.s125,
    );
  }

  Widget _renderOrangeContainer() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        color: Colors.orange,
        width: AppSize.s42,
        height: AppSize.s42,
      ),
    );
  }

  Widget _renderRowColumnOptions() {
    return AppOptionBottomSection(
      options: [
        _renderAlignmentOption(),
        _renderTextDirectionOption(),
        _renderStackFitOption(),
        _renderClipOption(),
      ],
    );
  }

  Widget _renderAlignmentOption() {
    return BlocSelector<StackAlignBloc, StackAlignState, Alignment>(
      selector: (state) {
        return state.alignment;
      },
      builder: (context, alignment) {
        return AppTextWithDropdown<Alignment>(
          label: AppString.alignment,
          value: alignment,
          listValue: context.read<StackAlignBloc>().state.listAlignmentOptions,
          onChanged: (value) =>
              context.read<StackAlignBloc>().changeOptionAlignment(value),
        );
      },
    );
  }

  Widget _renderTextDirectionOption() {
    return BlocSelector<StackAlignBloc, StackAlignState, TextDirection>(
      selector: (state) {
        return state.textDirection;
      },
      builder: (context, textDirection) {
        return AppTextWithDropdown<TextDirection>(
          label: AppString.textDirection,
          value: textDirection,
          listValue:
              context.read<StackAlignBloc>().state.listTextDirectionOptions,
          onChanged: (value) =>
              context.read<StackAlignBloc>().changeOptionTextDirection(value),
        );
      },
    );
  }

  Widget _renderStackFitOption() {
    return BlocSelector<StackAlignBloc, StackAlignState, StackFit>(
      selector: (state) {
        return state.stackFit;
      },
      builder: (context, stackFit) {
        return AppTextWithDropdown<StackFit>(
          label: AppString.stackFit,
          value: stackFit,
          listValue: context.read<StackAlignBloc>().state.listStackFitOptions,
          onChanged: (value) =>
              context.read<StackAlignBloc>().changeOptionStackFit(value),
        );
      },
    );
  }

  Widget _renderClipOption() {
    return BlocSelector<StackAlignBloc, StackAlignState, Clip>(
      selector: (state) {
        return state.clip;
      },
      builder: (context, clip) {
        return AppTextWithDropdown<Clip>(
          label: AppString.clip,
          value: clip,
          listValue: context.read<StackAlignBloc>().state.listClipOptions,
          onChanged: (value) =>
              context.read<StackAlignBloc>().changeOptionClip(value),
        );
      },
    );
  }
}
