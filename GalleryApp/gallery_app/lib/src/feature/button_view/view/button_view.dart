import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/feature/custom_box_shape_view/view/custom_box_shape_view.dart';
import 'package:gallery_app/src/network/data/app_constants.dart';
import 'package:gallery_app/src/router/coordinator.dart';
import 'package:gallery_app/widget/app_bar.dart';
import 'package:gallery_app/widget/option_bottom_section/item/text_and_dropdown.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

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
        backgroundColor: Colors.grey[400],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          children: [_renderAppBar(), Expanded(child: _renderBody(context))],
        ),
      ),
    );
  }

  Widget _renderAppBar() {
    return XAppBar(
      title: AppString.buttonView,
      leading: IconButton(
        onPressed: () => AppCoordinator.showDashboardScreen(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: const [
        Icon(
          Icons.clear,
          color: Colors.red,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p15),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ))
      ],
    );
  }

  Widget _renderBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _renderDropdownButton(),
            _renderDropdownFromFieldButton(),
            _renderIconButton(),
            _renderElevatedButton(),
            _renderElevatedButtonIcon(),
            _renderTextButton(),
            _renderTextButtonIcon(),
            _renderOutlinedButton(),
            _renderOutlinedButtonIcon(),
            _renderCupertinoButton(),
            _renderMaterialButton(),
            _renderRawMaterialButton(),
            _renderToggleButton(),
          ],
        ),
      ),
    );
  }

  Widget _renderDropdownButton() {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: AppTextWithDropdown<OutlinedBorder>(
          hintText: AppString.dropdown,
          listValue: AppConstant.listShapeOptions,
          onChanged: (value) {},
        ));
  }

  Widget _renderDropdownFromFieldButton() {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: DropdownButtonFormField(
            items: AppConstant.listAlignmentOptions,
            hint: const Text(AppString.dropdownFormField),
            onChanged: (value) {}));
  }

  Widget _renderIconButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r8),
              color: Colors.black),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _renderElevatedButton() {
    return ElevatedButton(
        onPressed: () {},
        child: const Center(child: Text(AppString.elevatedButton)));
  }

  Widget _renderElevatedButtonIcon() {
    return ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.account_circle),
        label: const Text(AppString.elevatedButton));
  }

  Widget _renderTextButton() {
    return TextButton(
        onPressed: () {}, child: const Text(AppString.textButton));
  }

  Widget _renderTextButtonIcon() {
    return TextButton.icon(
      onPressed: () {},
      label: const Text(AppString.textButton),
      icon: const Icon(Icons.account_circle),
    );
  }

  Widget _renderOutlinedButton() {
    return OutlinedButton(
        onPressed: () {}, child: const Text(AppString.outlinedButton));
  }

  Widget _renderOutlinedButtonIcon() {
    return OutlinedButton.icon(
      onPressed: () {},
      label: const Text(AppString.outlinedButton),
      icon: const Icon(Icons.account_circle),
    );
  }

  Widget _renderCupertinoButton() {
    return CupertinoButton(
      onPressed: () {},
      color: Colors.grey,
      child: const Text(AppString.cupertinoButton),
    );
  }

  Widget _renderMaterialButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        MaterialButton(
            onPressed: () {},
            child: CustomPaint(
              size: const Size(double.infinity, AppSize.s36),
              painter: CouponPainter(
                  borderRadius: AppRadius.r8, isHasDashLine: false),
            )),
        const Text(
          AppString.materialButton,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _renderRawMaterialButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {},
          child: CustomPaint(
            size: const Size(double.infinity, AppSize.s36),
            painter:
                CouponPainter(borderRadius: AppRadius.r8, isHasDashLine: false),
          ),
        ),
        const Text(
          AppString.rawMaterialButton,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _renderToggleButton() {
    return ToggleButtons(
      borderWidth: 3,
      isSelected: const [false, true, false],
      onPressed: (value) {},
      children: const [
        Text(AppString.option1),
        Text(AppString.option2),
        Text(AppString.option3),
      ],
    );
  }
}
