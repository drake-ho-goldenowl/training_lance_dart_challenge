import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/feature/wrap_chip_view/logic/wrap_chip_bloc.dart';
import 'package:gallery_app/src/feature/wrap_chip_view/logic/wrap_chip_state.dart';
import 'package:gallery_app/src/router/coordinator.dart';
import 'package:gallery_app/src/utils/text_utils.dart';
import 'package:gallery_app/widget/app_bar.dart';
import 'package:gallery_app/widget/option_bottom_section/item/text_and_dropdown.dart';
import 'package:gallery_app/widget/option_bottom_section/item/text_with_switch.dart';
import 'package:gallery_app/widget/option_bottom_section/options_bottom_section.dart';

class WrapAndChipView extends StatelessWidget {
  const WrapAndChipView({super.key});

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
        backgroundColor: const Color.fromARGB(255, 229, 229, 229),
        body: Column(
          children: [_renderAppBar(), Expanded(child: _renderBody(context))],
        ),
      ),
    );
  }

  Widget _renderAppBar() {
    return XAppBar(
      title: AppString.wrapView,
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
      children: [_renderChipSamples(), _renderWrapViewOptions()],
    );
  }

  Widget _renderChipSamples() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: BlocBuilder<WrapAndChipBloc, WrapAndChipState>(
          builder: (context, state) {
            return Column(
              children: [
                _renderChipChips(state),
                const SizedBox(height: AppPadding.p12),
                _renderChoiceChips(state),
                const SizedBox(height: AppPadding.p12),
                _renderInputChip(state),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _renderChipChips(WrapAndChipState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          AppString.chipChip,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: state.isSpacing ? AppPadding.p16 : AppPadding.p0,
          runSpacing: state.isRunSpacing ? AppPadding.p16 : AppPadding.p0,
          children: [
            _renderStandardChip(state),
            _renderActionChip(state),
            _renderRawChip(state),
          ],
        )
      ],
    );
  }

  Widget _renderStandardChip(WrapAndChipState state) {
    return Chip(
        backgroundColor: Colors.grey[400],
        avatar: state.isShowAvatar
            ? CircleAvatar(
                backgroundColor: Colors.grey[400],
                child: Text(StringUtils.collapseText(text: AppString.chip)),
              )
            : null,
        onDeleted: state.isShowDeleteIcon ? () {} : null,
        shape: state.shape,
        elevation: state.isShowElevation ? 1 : 0,
        deleteIcon: const Icon(
          Icons.cancel,
          color: Colors.red,
          size: AppSize.s20,
        ),
        label: const Text(AppString.chip));
  }

  Widget _renderActionChip(WrapAndChipState state) {
    return ActionChip(
      backgroundColor: Colors.grey[400],
      avatar: state.isShowAvatar
          ? CircleAvatar(
              backgroundColor: Colors.grey[400],
              child: Text(StringUtils.collapseText(text: AppString.actionChip)),
            )
          : null,
      shape: state.shape,
      elevation: state.isShowElevation ? 2 : 0,
      label: const Text(AppString.actionChip),
    );
  }

  Widget _renderRawChip(WrapAndChipState state) {
    return RawChip(
        backgroundColor: Colors.grey[400],
        avatar: state.isShowAvatar
            ? CircleAvatar(
                backgroundColor: Colors.grey[400],
                child: Text(StringUtils.collapseText(text: AppString.rawChip)),
              )
            : null,
        onDeleted: state.isShowDeleteIcon ? () {} : null,
        shape: state.shape,
        elevation: state.isShowElevation ? 3 : 0,
        pressElevation: 2,
        deleteIcon: const Icon(
          Icons.cancel,
          color: Colors.red,
          size: AppSize.s20,
        ),
        label: const Text(AppString.rawChip));
  }

  Widget _renderChoiceChips(WrapAndChipState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          AppString.choiceChip,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: state.isSpacing ? AppPadding.p16 : AppPadding.p0,
          runSpacing: state.isRunSpacing ? AppPadding.p16 : AppPadding.p0,
          children: [
            _renderDisableChoiceChip(state),
            _renderSmallChoiceChip(state),
            _renderLargeChoiceChip(state)
          ],
        )
      ],
    );
  }

  Widget _renderDisableChoiceChip(WrapAndChipState state) {
    return ChoiceChip(
      label: const Text(AppString.disable),
      avatar: state.isShowAvatar
          ? CircleAvatar(
              backgroundColor: Colors.grey[400],
              child: Text(StringUtils.collapseText(text: AppString.disable)),
            )
          : null,
      shape: state.shape,
      elevation: state.isShowElevation ? 3 : 0,
      selected: true,
      onSelected: null,
    );
  }

  Widget _renderSmallChoiceChip(WrapAndChipState state) {
    return ChoiceChip(
      label: const Text(AppString.small),
      selected: true,
      selectedColor: Colors.blue[200],
      onSelected: null,
      avatar: state.isShowAvatar
          ? CircleAvatar(
              backgroundColor: Colors.grey[400],
              child: Text(StringUtils.collapseText(text: AppString.small)),
            )
          : null,
      shape: state.shape,
      elevation: state.isShowElevation ? 3 : 0,
    );
  }

  Widget _renderLargeChoiceChip(WrapAndChipState state) {
    return ChoiceChip(
      label: const Text(AppString.large),
      selected: true,
      onSelected: (value) {},
      avatar: state.isShowAvatar
          ? CircleAvatar(
              backgroundColor: Colors.grey[400],
              child: Text(StringUtils.collapseText(text: AppString.large)),
            )
          : null,
      shape: state.shape,
      elevation: state.isShowElevation ? 3 : 0,
    );
  }

  Widget _renderInputChip(WrapAndChipState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          AppString.inputChip,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: state.isSpacing ? AppPadding.p16 : AppPadding.p0,
          runSpacing: state.isRunSpacing ? AppPadding.p16 : AppPadding.p0,
          children: [
            _renderDisableInputChip(state),
            _renderIOSInputChip(state),
            _renderAndroidInputChip(state)
          ],
        )
      ],
    );
  }

  Widget _renderDisableInputChip(WrapAndChipState state) {
    return InputChip(
      label: const Text(AppString.disable),
      isEnabled: false,
      selected: false,
      disabledColor: Colors.grey[350],
      avatar: state.isShowAvatar
          ? CircleAvatar(
              backgroundColor: Colors.grey[400],
              child: Text(StringUtils.collapseText(text: AppString.disable)),
            )
          : null,
      onDeleted: state.isShowDeleteIcon ? () {} : null,
      shape: state.shape,
      elevation: state.isShowElevation ? 3 : 0,
    );
  }

  Widget _renderIOSInputChip(WrapAndChipState state) {
    return InputChip(
      label: const Text(AppString.ios),
      onPressed: () {},
      avatar: state.isShowAvatar
          ? CircleAvatar(
              backgroundColor: Colors.grey[400],
              child: Text(StringUtils.collapseText(text: AppString.ios)),
            )
          : null,
      onDeleted: state.isShowDeleteIcon ? () {} : null,
      shape: state.shape,
      elevation: state.isShowElevation ? 3 : 0,
    );
  }

  Widget _renderAndroidInputChip(WrapAndChipState state) {
    return InputChip(
      label: const Text(AppString.android),
      onPressed: () {},
      selected: true,
      avatar: state.isShowAvatar
          ? CircleAvatar(
              backgroundColor: Colors.grey[400],
              child: Text(StringUtils.collapseText(text: AppString.android)),
            )
          : null,
      onDeleted: state.isShowDeleteIcon ? () {} : null,
      shape: state.shape,
      elevation: state.isShowElevation ? 3 : 0,
    );
  }

  Widget _renderWrapViewOptions() {
    return AppOptionBottomSection(
      options: [
        _renderLine1InOptionsSection(),
        _renderLine2InOptionsSection(),
        _renderLine3InOptionsSection(),
      ],
    );
  }

  Widget _renderLine1InOptionsSection() {
    return Row(
      children: [
        _renderElevationOptions(),
        const SizedBox(width: AppPadding.p10),
        _renderAvatarOptions(),
      ],
    );
  }

  Widget _renderElevationOptions() {
    return BlocSelector<WrapAndChipBloc, WrapAndChipState, bool>(
      selector: (state) => state.isShowElevation,
      builder: (context, isShow) => Expanded(
          child: AppTextWithSwitch(
        label: AppString.elevation,
        value: isShow,
        onChanged: (isShow) =>
            context.read<WrapAndChipBloc>().showElevation(isShow),
      )),
    );
  }

  Widget _renderAvatarOptions() {
    return BlocSelector<WrapAndChipBloc, WrapAndChipState, bool>(
      selector: (state) => state.isShowAvatar,
      builder: (context, isShow) => Expanded(
          child: AppTextWithSwitch(
        label: AppString.avatar,
        value: isShow,
        onChanged: (isShow) =>
            context.read<WrapAndChipBloc>().showAvatar(isShow),
      )),
    );
  }

  Widget _renderLine2InOptionsSection() {
    return Row(
      children: [
        _renderDeleteIconOptions(),
        const SizedBox(width: AppPadding.p10),
        _renderChipShapeOptions(),
      ],
    );
  }

  Widget _renderDeleteIconOptions() {
    return BlocSelector<WrapAndChipBloc, WrapAndChipState, bool>(
      selector: (state) => state.isShowDeleteIcon,
      builder: (context, isShow) => Expanded(
          child: AppTextWithSwitch(
        label: AppString.deleteIcon,
        value: isShow,
        onChanged: (isShow) =>
            context.read<WrapAndChipBloc>().showDeleteIcon(isShow),
      )),
    );
  }

  Widget _renderChipShapeOptions() {
    return BlocSelector<WrapAndChipBloc, WrapAndChipState, OutlinedBorder>(
      selector: (state) => state.shape,
      builder: (context, shape) => Expanded(
        child: AppTextWithDropdown<OutlinedBorder>(
          value: shape,
          listValue: context.read<WrapAndChipBloc>().state.listShape,
          onChanged: (shape) =>
              context.read<WrapAndChipBloc>().changeShapeOfChip(shape),
        ),
      ),
    );
  }

  Widget _renderLine3InOptionsSection() {
    return Row(
      children: [
        _renderSpacingOptions(),
        const SizedBox(width: AppPadding.p10),
        _renderRunSpacingOptions(),
      ],
    );
  }

  Widget _renderSpacingOptions() {
    return BlocSelector<WrapAndChipBloc, WrapAndChipState, bool>(
      selector: (state) => state.isSpacing,
      builder: (context, isShow) => Expanded(
          child: AppTextWithSwitch(
        label: AppString.spacing,
        value: isShow,
        onChanged: (isShow) =>
            context.read<WrapAndChipBloc>().showSpacing(isShow),
      )),
    );
  }

  Widget _renderRunSpacingOptions() {
    return BlocSelector<WrapAndChipBloc, WrapAndChipState, bool>(
      selector: (state) => state.isRunSpacing,
      builder: (context, isShow) => Expanded(
          child: AppTextWithSwitch(
        label: AppString.runSpacing,
        value: isShow,
        onChanged: (isShow) =>
            context.read<WrapAndChipBloc>().showRunSpacing(isShow),
      )),
    );
  }
}
