import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/router/coordinator.dart';
import 'package:gallery_app/widget/app_bar.dart';

class RichTextView extends StatelessWidget {
  const RichTextView({super.key});

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
        body: Column(
          children: [_renderAppBar(), Expanded(child: _renderBody(context))],
        ),
      ),
    );
  }

  Widget _renderAppBar() {
    return XAppBar(
      title: AppString.richTextView,
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
      children: [
        _renderTextWidget(context),
        _renderTheFirstRichText(),
        _renderCountNumberRichText(),
        _renderGoogleRichText()
      ],
    );
  }

  Widget _renderTextWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: Text(
        AppString.createATextWidget,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .primaryTextTheme
            .displayMedium!
            .copyWith(color: const Color.fromARGB(255, 248, 8, 228)),
      ),
    );
  }

  Widget _renderTheFirstRichText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(AppString.first),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p6),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.red,
            ),
          ),
          const Text(
            AppString.second,
            style: TextStyle(fontSize: AppFontSize.f20, color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
            child: Container(
              width: AppSize.s42,
              height: AppSize.s42,
              color: Colors.yellow,
            ),
          ),
          const Text(
            AppString.third,
            style: TextStyle(fontSize: AppFontSize.f20, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _renderCountNumberRichText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: RichText(
          text: const TextSpan(
              text: AppString.one,
              style: TextStyle(color: Colors.black),
              children: [
            TextSpan(
                text: AppString.two,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    fontSize: AppFontSize.f24,
                    decoration: TextDecoration.underline)),
            TextSpan(text: AppString.three),
            TextSpan(text: AppString.four),
            TextSpan(
                text: AppString.five,
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.red,
                    fontSize: AppFontSize.f24))
          ])),
    );
  }

  Widget _renderGoogleRichText() {
    final listGoogleText = AppString.google.split('');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: listGoogleText.first,
              style: const TextStyle(
                  backgroundColor: Color.fromARGB(255, 195, 146, 87),
                  color: Colors.blue,
                  fontSize: AppFontSize.f20,
                  height: 1.5),
              children: [
                _renderSecondLetterGoogle(listGoogleText[1]),
                _renderThirdLetterGoogle(listGoogleText[2]),
                _renderFourthLetterGoogle(listGoogleText[3]),
                _renderFifthLetterGoogle(listGoogleText[4]),
                _renderSixthLetterGoogle(listGoogleText[5]),
              ])),
    );
  }

  TextSpan _renderSecondLetterGoogle(String letter) {
    return TextSpan(
      text: letter,
      style: const TextStyle(
          backgroundColor: Color.fromARGB(255, 241, 172, 172),
          color: Colors.red,
          fontSize: AppFontSize.f20,
          fontWeight: FontWeight.w900,
          height: 2),
    );
  }

  TextSpan _renderThirdLetterGoogle(String letter) {
    return TextSpan(
      text: letter,
      style: const TextStyle(
          backgroundColor: Color.fromARGB(255, 196, 85, 152),
          color: Colors.yellow,
          fontSize: AppFontSize.f20,
          fontWeight: FontWeight.w900,
          height: 2),
    );
  }

  TextSpan _renderFourthLetterGoogle(String letter) {
    return TextSpan(
      text: letter,
      style: const TextStyle(
          backgroundColor: Color.fromARGB(255, 195, 146, 87),
          color: Colors.blue,
          fontSize: AppFontSize.f20,
          height: 1.5),
    );
  }

  TextSpan _renderFifthLetterGoogle(String letter) {
    return TextSpan(
      text: letter,
      style: const TextStyle(
          backgroundColor: Color.fromARGB(255, 241, 172, 172),
          color: Colors.green,
          fontSize: AppFontSize.f20,
          fontWeight: FontWeight.w900,
          height: 1.75),
    );
  }

  TextSpan _renderSixthLetterGoogle(String letter) {
    return TextSpan(
      text: letter,
      style: const TextStyle(
          backgroundColor: Color.fromARGB(255, 195, 146, 87),
          color: Colors.red,
          fontSize: AppFontSize.f20,
          height: 1.5),
    );
  }
}
