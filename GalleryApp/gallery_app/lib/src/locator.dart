import 'package:flutter/material.dart';
import 'package:gallery_app/src/router/router.dart';
import 'package:get_it/get_it.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  _locator();
}

void _locator() {
  GetIt.I.registerLazySingleton(() => AppRouter());
}
