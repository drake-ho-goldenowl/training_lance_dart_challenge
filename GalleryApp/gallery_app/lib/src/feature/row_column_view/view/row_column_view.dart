import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/feature/row_column_view/logic/row_column_bloc.dart';
import 'package:gallery_app/src/feature/row_column_view/logic/row_column_state.dart';
import 'package:gallery_app/src/network/data/app_constants.dart';
import 'package:gallery_app/src/router/coordinator.dart';
import 'package:gallery_app/widget/app_bar.dart';
import 'package:gallery_app/widget/option_bottom_section/item/text_and_dropdown.dart';
import 'package:gallery_app/widget/option_bottom_section/options_bottom_section.dart';

class RowColumnView extends StatelessWidget {
  const RowColumnView({super.key});

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
      title: AppString.rowColumn,
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
      children: [_renderRowColumnSample(), _renderRowColumnOptions()],
    );
  }

  Widget _renderRowColumnSample() {
    return Expanded(child: BlocBuilder<RowColumnBloc, RowColumnState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
              color: Colors.amber,
              child: state.mode == RowColumnMode.column
                  ? _renderColumnMode(state)
                  : _renderRowMode(state)),
        );
      },
    ));
  }

  Widget _renderColumnMode(RowColumnState state) {
    return Column(
      mainAxisSize: state.mainAxisSize,
      mainAxisAlignment: state.mainAxisAlignment,
      crossAxisAlignment: state.crossAxisAlignment,
      textDirection: state.textDirection,
      textBaseline: state.textBaseline,
      verticalDirection: state.verticalDirection,
      children: _renderListSamples(),
    );
  }

  Widget _renderRowMode(RowColumnState state) {
    return Row(
      mainAxisSize: state.mainAxisSize,
      mainAxisAlignment: state.mainAxisAlignment,
      crossAxisAlignment: state.crossAxisAlignment,
      textDirection: state.textDirection,
      textBaseline: state.textBaseline,
      verticalDirection: state.verticalDirection,
      children: _renderListSamples(),
    );
  }

  List<Widget> _renderListSamples() {
    return <Widget>[
      const Icon(Icons.brightness_auto,
          color: Colors.black, size: AppFontSize.f20),
      const Icon(Icons.brightness_auto, color: Colors.black, size: AppSize.s42),
      const Icon(Icons.brightness_auto,
          color: Colors.black, size: AppFontSize.f20)
    ];
  }

  Widget _renderRowColumnOptions() {
    return AppOptionBottomSection(
      options: [
        _renderSelectMode(),
        _renderMainAxisSizeOption(),
        _renderMainAxisAlignmentOption(),
        _renderCrossAxisAlignmentOption(),
        _renderVerticalDirectionOption(),
        _renderTextDirectionOption(),
        _renderTextBaseLineOption(),
      ],
    );
  }

  Widget _renderSelectMode() {
    return BlocSelector<RowColumnBloc, RowColumnState, RowColumnMode>(
      selector: (state) {
        return state.mode;
      },
      builder: (context, mode) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            _renderRadioItem(
                label: AppString.row,
                mode: mode,
                value: AppConstant.listMode.first,
                onChanged: (value) => context
                    .read<RowColumnBloc>()
                    .changeMode(value ?? RowColumnMode.row)),
            _renderRadioItem(
                label: AppString.column,
                mode: mode,
                value: AppConstant.listMode.last,
                onChanged: (value) => context
                    .read<RowColumnBloc>()
                    .changeMode(value ?? RowColumnMode.row)),
          ],
        );
      },
    );
  }

  Widget _renderRadioItem(
      {required String label,
      RowColumnMode? mode,
      required RowColumnMode value,
      required Function(RowColumnMode?) onChanged}) {
    return Expanded(
      child: ListTile(
        title: Text(label),
        leading: Radio<RowColumnMode>(
          value: value,
          groupValue: mode,
          onChanged: (value) => onChanged.call(value),
        ),
      ),
    );
  }

  Widget _renderMainAxisSizeOption() {
    return BlocSelector<RowColumnBloc, RowColumnState, MainAxisSize>(
      selector: (state) {
        return state.mainAxisSize;
      },
      builder: (context, mainAxisSize) {
        return AppTextWithDropdown<MainAxisSize>(
          label: AppString.mainAxisSize,
          value: mainAxisSize,
          listValue:
              context.read<RowColumnBloc>().state.listMainAxisSizeOptions,
          onChanged: (value) =>
              context.read<RowColumnBloc>().changeOptionMainAxisSize(value),
        );
      },
    );
  }

  Widget _renderMainAxisAlignmentOption() {
    return BlocSelector<RowColumnBloc, RowColumnState, MainAxisAlignment>(
      selector: (state) {
        return state.mainAxisAlignment;
      },
      builder: (context, mainAxisAlignment) {
        return AppTextWithDropdown<MainAxisAlignment>(
          label: AppString.mainAxisAlignment,
          value: mainAxisAlignment,
          listValue:
              context.read<RowColumnBloc>().state.listMainAxisAlignmentOptions,
          onChanged: (value) => context
              .read<RowColumnBloc>()
              .changeOptionMainAxisAlignment(value),
        );
      },
    );
  }

  Widget _renderCrossAxisAlignmentOption() {
    return BlocSelector<RowColumnBloc, RowColumnState, CrossAxisAlignment>(
      selector: (state) {
        return state.crossAxisAlignment;
      },
      builder: (context, crossAxisAlignment) {
        return AppTextWithDropdown<CrossAxisAlignment>(
          label: AppString.crossAxisAlignment,
          value: crossAxisAlignment,
          listValue:
              context.read<RowColumnBloc>().state.listCrossAxisAlignmentOptions,
          onChanged: (value) => context
              .read<RowColumnBloc>()
              .changeOptionCrossAxisAlignment(value),
        );
      },
    );
  }

  Widget _renderVerticalDirectionOption() {
    return BlocSelector<RowColumnBloc, RowColumnState, VerticalDirection>(
      selector: (state) {
        return state.verticalDirection;
      },
      builder: (context, verticalDirection) {
        return AppTextWithDropdown<VerticalDirection>(
          label: AppString.verticalDirection,
          value: verticalDirection,
          listValue:
              context.read<RowColumnBloc>().state.listVerticalDirectionOptions,
          onChanged: (value) => context
              .read<RowColumnBloc>()
              .changeOptionVerticalDirection(value),
        );
      },
    );
  }

  Widget _renderTextDirectionOption() {
    return BlocSelector<RowColumnBloc, RowColumnState, TextDirection>(
      selector: (state) {
        return state.textDirection;
      },
      builder: (context, textDirection) {
        return AppTextWithDropdown<TextDirection>(
          label: AppString.verticalDirection,
          value: textDirection,
          listValue:
              context.read<RowColumnBloc>().state.listTextDirectionOptions,
          onChanged: (value) =>
              context.read<RowColumnBloc>().changeOptionTextDirection(value),
        );
      },
    );
  }

  Widget _renderTextBaseLineOption() {
    return BlocSelector<RowColumnBloc, RowColumnState, TextBaseline>(
      selector: (state) {
        return state.textBaseline;
      },
      builder: (context, textBaseline) {
        return AppTextWithDropdown<TextBaseline>(
          label: AppString.verticalDirection,
          value: textBaseline,
          listValue:
              context.read<RowColumnBloc>().state.listTextBaselineOptions,
          onChanged: (value) =>
              context.read<RowColumnBloc>().changeOptionTextBaseline(value),
        );
      },
    );
  }
}
