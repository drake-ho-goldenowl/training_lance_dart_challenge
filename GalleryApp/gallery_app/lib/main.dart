import 'package:flutter/material.dart';
import 'package:gallery_app/src/locator.dart';
import 'package:gallery_app/src/router/router.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<AppRouter>();
    return MaterialApp.router(
      title: 'Gallery Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter.router,
    );
  }
}
