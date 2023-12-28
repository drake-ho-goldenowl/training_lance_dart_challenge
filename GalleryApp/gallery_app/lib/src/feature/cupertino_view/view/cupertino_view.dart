import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/feature/cupertino_view/logic/cupertino_bloc.dart';
import 'package:gallery_app/src/feature/cupertino_view/logic/cupertino_state.dart';

class CupertinoView extends StatelessWidget {
  const CupertinoView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoTabScaffold(
        tabBar: _listTabs(),
        tabBuilder: (context, index) => CupertinoPageScaffold(
          child: _renderCupertinoWidgets(context),
        ),
      ),
    );
  }

  CupertinoTabBar _listTabs() {
    return CupertinoTabBar(items: const [
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings), label: AppString.widget),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.collections), label: AppString.modal),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.news), label: AppString.widget),
    ]);
  }

  Widget _renderCupertinoWidgets(BuildContext context) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        const CupertinoSliverNavigationBar(
          largeTitle: Text(AppString.widget),
        ),
        _renderRefreshController(context),
        _renderListCupertinoWidget(),
      ],
    );
  }

  CupertinoSliverRefreshControl _renderRefreshController(BuildContext context) {
    return CupertinoSliverRefreshControl(
      onRefresh: () async {
        await Future<void>.delayed(
          const Duration(milliseconds: 1000),
        ).then((value) => context.read<CupertinoBloc>().pullToRefresh(true));
      },
    );
  }

  Widget _renderListCupertinoWidget() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            children: [
              _renderTextPullToRefresh(context),
              _renderIndicator(context),
              _renderButton(context),
              _renderSlider(context),
              _renderSwitch(context),
            ],
          ),
        ),
        childCount: 1,
      ),
    );
  }

  Widget _renderTextPullToRefresh(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Text(AppString.pullToRefresh,
          style: CupertinoTheme.of(context).textTheme.dateTimePickerTextStyle),
    );
  }

  Widget _renderIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppString.indicator,
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
          const CupertinoActivityIndicator()
        ],
      ),
    );
  }

  Widget _renderButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppString.indicator,
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
          CupertinoButton(
              child: Text(
                AppString.button,
                style: CupertinoTheme.of(context).textTheme.actionTextStyle,
              ),
              onPressed: () {}),
          CupertinoButton.filled(
              child: const Text(
                AppString.withBackground,
              ),
              onPressed: () {})
        ],
      ),
    );
  }

  Widget _renderSlider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppString.sliderText,
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
          _renderCupertinoSlidersSample(),
        ],
      ),
    );
  }

  Widget _renderCupertinoSlidersSample() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _renderDisableCupertinoSlider(),
        _renderEnableCupertinoSlider(),
      ],
    );
  }

  Widget _renderDisableCupertinoSlider() {
    return const CupertinoSlider(
      value: 0.5,
      onChanged: null,
    );
  }

  Widget _renderEnableCupertinoSlider() {
    return BlocSelector<CupertinoBloc, CupertinoState, double>(
      selector: (state) {
        return state.sliderValue;
      },
      builder: (context, state) {
        return CupertinoSlider(
          value: state,
          onChanged: (value) =>
              context.read<CupertinoBloc>().changeSliderValue(value),
        );
      },
    );
  }

  Widget _renderSwitch(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppString.switchText,
            style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
          ),
          _renderCupertinoSwitchsSample(),
        ],
      ),
    );
  }

  Widget _renderCupertinoSwitchsSample() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _renderDisableCuperSwitch(),
        _renderEnableCuperSwitch(),
      ],
    );
  }

  Widget _renderDisableCuperSwitch() {
    return const CupertinoSwitch(value: false, onChanged: null);
  }

  Widget _renderEnableCuperSwitch() {
    return BlocSelector<CupertinoBloc, CupertinoState, bool>(
      selector: (state) {
        return state.switchValue;
      },
      builder: (context, state) {
        return CupertinoSwitch(
            value: state,
            onChanged: (value) =>
                context.read<CupertinoBloc>().changeSwitchValue(value));
      },
    );
  }
}
