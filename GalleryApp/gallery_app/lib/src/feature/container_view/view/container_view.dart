import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/feature/container_view/logic/container_bloc.dart';
import 'package:gallery_app/src/feature/container_view/logic/container_state.dart';
import 'package:gallery_app/src/router/coordinator.dart';
import 'package:gallery_app/widget/app_bar.dart';
import 'package:gallery_app/widget/option_bottom_section/item/text_and_dropdown.dart';
import 'package:gallery_app/widget/option_bottom_section/item/text_with_switch.dart';
import 'package:gallery_app/widget/option_bottom_section/options_bottom_section.dart';

class ContainerView extends StatelessWidget {
  const ContainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        primaryTextTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: AppFontSize.f20,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w900)),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: Column(
          children: [_renderAppBar(), Expanded(child: _renderBody(context))],
        ),
      ),
    );
  }

  Widget _renderAppBar() {
    return XAppBar(
      title: AppString.containerView,
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
      children: [_renderContainerSample(), _renderContainerOptions()],
    );
  }

  Widget _renderContainerSample() {
    return Expanded(child: Center(
      child: BlocBuilder<ContainerBloc, ContainerState>(
        builder: (context, state) {
          return Container(
            width: AppSize.s200,
            height: AppSize.s200,
            decoration: BoxDecoration(
                color: state.background,
                borderRadius: BorderRadius.circular(state.borderRadius),
                backgroundBlendMode: state.blendMode,
                border: state.isShowBorder
                    ? Border.all()
                    : Border.all(color: Colors.transparent),
                boxShadow: state.isShowBoxShadow
                    ? [
                        const BoxShadow(
                            blurRadius: 1.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 2))
                      ]
                    : []),
          );
        },
      ),
    ));
  }

  Widget _renderContainerOptions() {
    return AppOptionBottomSection(
      options: [
        _renderBorderOption(),
        _renderBorderRadiusOption(),
        _renderBoxShadowOption(),
        _renderBackgroundOption(),
        _renderBlendModeOption(),
      ],
    );
  }

  Widget _renderBorderOption() {
    return BlocSelector<ContainerBloc, ContainerState, bool>(
      selector: (state) {
        return state.isShowBorder;
      },
      builder: (context, state) {
        return AppTextWithSwitch(
          label: AppString.border,
          value: state,
          onChanged: (value) =>
              context.read<ContainerBloc>().changeOptionShowBorder(value),
        );
      },
    );
  }

  Widget _renderBorderRadiusOption() {
    return BlocSelector<ContainerBloc, ContainerState, double>(
      selector: (state) {
        return state.borderRadius;
      },
      builder: (context, radius) {
        return AppTextWithDropdown<double>(
          label: AppString.borderRadius,
          value: radius,
          listValue:
              context.read<ContainerBloc>().state.listBorderRadiusOptions,
          onChanged: (value) =>
              context.read<ContainerBloc>().changeOptionBorderRadius(value),
        );
      },
    );
  }

  Widget _renderBoxShadowOption() {
    return BlocSelector<ContainerBloc, ContainerState, bool>(
      selector: (state) {
        return state.isShowBoxShadow;
      },
      builder: (context, state) {
        return AppTextWithSwitch(
          label: AppString.boxShadow,
          value: state,
          onChanged: (value) =>
              context.read<ContainerBloc>().changeOptionShowBoxShadow(value),
        );
      },
    );
  }

  Widget _renderBackgroundOption() {
    return BlocSelector<ContainerBloc, ContainerState, MaterialColor>(
        selector: (state) => state.background,
        builder: (context, state) => AppTextWithDropdown<MaterialColor>(
              label: AppString.background,
              value: state,
              listValue:
                  context.read<ContainerBloc>().state.listBackGrColorOptions,
              onChanged: (value) => context
                  .read<ContainerBloc>()
                  .changeOptionBackGroundColor(value),
            ));
  }

  Widget _renderBlendModeOption() {
    return BlocSelector<ContainerBloc, ContainerState, BlendMode>(
      selector: (state) {
        return state.blendMode;
      },
      builder: (context, state) {
        return AppTextWithDropdown<BlendMode>(
          label: AppString.blendMode,
          value: state,
          onChanged: (value) =>
              context.read<ContainerBloc>().changeOptionBlendMode(value),
          listValue: context.read<ContainerBloc>().state.listBlendModeOptions,
        );
      },
    );
  }
}
