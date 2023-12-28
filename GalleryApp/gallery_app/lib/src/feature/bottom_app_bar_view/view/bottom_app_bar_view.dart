import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/feature/bottom_app_bar_view/logic/bottom_app_bar_bloc.dart';
import 'package:gallery_app/src/feature/bottom_app_bar_view/logic/bottom_app_bar_state.dart';
import 'package:gallery_app/src/router/coordinator.dart';
import 'package:gallery_app/widget/app_bar.dart';
import 'package:gallery_app/widget/option_bottom_section/item/text_with_switch.dart';

class BottomAppBarView extends StatelessWidget {
  const BottomAppBarView({super.key});

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
      child: BlocBuilder<BottomAppBarBloc, BottomAppBarState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 224, 223, 223),
            body: Column(
              children: [
                _renderAppBar(),
                Expanded(child: _renderBody(context, state: state))
              ],
            ),
            bottomNavigationBar: _renderBottomNavBar(state),
            floatingActionButton: state.isShowFloatButton
                ? _renderFloatingButton()
                : const SizedBox.shrink(),
            floatingActionButtonLocation: state.buttonLocation,
          );
        },
      ),
    );
  }

  Widget _renderAppBar() {
    return XAppBar(
      title: AppString.bottomAppBarView,
      leading: IconButton(
        onPressed: () => AppCoordinator.showDashboardScreen(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _renderBottomNavBar(BottomAppBarState state) {
    return BottomAppBar(
      shape: state.isShowFloatButton ? const CircularNotchedRectangle() : null,
      notchMargin: state.hasNotch ? 4.0 : 0.0,
      color: Colors.white,
      child: const SizedBox(
        height: AppSize.s50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: AppPadding.p12),
            Icon(Icons.menu),
            SizedBox(width: AppPadding.p12),
            Icon(Icons.search),
            SizedBox(width: AppPadding.p12),
            Icon(Icons.favorite),
          ],
        ),
      ),
    );
  }

  Widget _renderFloatingButton() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: Colors.blue,
      onPressed: () {},
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  Widget _renderBody(BuildContext context, {required BottomAppBarState state}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
      child: Column(
        children: [
          _renderListOptions(context, state),
          const Divider(),
          _renderListButtonPositions(context, state)
        ],
      ),
    );
  }

  Widget _renderListOptions(BuildContext context, BottomAppBarState state) {
    return Column(
      children: [
        _renderShowFloatOption(context, state),
        _renderShowNotchOption(context, state),
      ],
    );
  }

  Widget _renderShowFloatOption(BuildContext context, BottomAppBarState state) {
    return AppTextWithSwitch(
      label: AppString.floatActionButton,
      value: state.isShowFloatButton,
      onChanged: (value) =>
          context.read<BottomAppBarBloc>().showHideFloatingButton(value),
    );
  }

  Widget _renderShowNotchOption(BuildContext context, BottomAppBarState state) {
    return AppTextWithSwitch(
      label: AppString.notch,
      value: state.hasNotch,
      onChanged: state.isShowFloatButton
          ? (value) =>
              context.read<BottomAppBarBloc>().changeNotchOptions(value)
          : null,
    );
  }

  Widget _renderListButtonPositions(
      BuildContext context, BottomAppBarState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppString.floatActionButtonPosition,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        _renderRatioItems(context,
            state: state,
            label: AppString.dockedEnd,
            location: FloatingActionButtonLocation.endDocked),
        _renderRatioItems(context,
            state: state,
            label: AppString.dockedCenter,
            location: FloatingActionButtonLocation.centerDocked),
        _renderRatioItems(context,
            state: state,
            label: AppString.floatingEnd,
            location: FloatingActionButtonLocation.endFloat),
        _renderRatioItems(context,
            state: state,
            label: AppString.floatingCenter,
            location: FloatingActionButtonLocation.centerFloat),
      ],
    );
  }

  Widget _renderRatioItems(BuildContext context,
      {required BottomAppBarState state,
      required FloatingActionButtonLocation location,
      required String label}) {
    return ListTile(
      title: Text(label),
      leading: Radio<FloatingActionButtonLocation>(
        value: location,
        groupValue: state.buttonLocation,
        onChanged: state.isShowFloatButton
            ? (value) => value != null
                ? context.read<BottomAppBarBloc>().changeButtonPosition(value)
                : ()
            : null,
      ),
    );
  }
}
