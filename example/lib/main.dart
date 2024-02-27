import 'package:flutter/material.dart';
import 'package:graphify_example/core/custom_scroll_behavior.dart';
import 'package:graphify_example/core/responsibility.dart';
import 'package:graphify_example/core/router.dart';

void main() {

  Responsibility();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Graphify Example',
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      backButtonDispatcher: RootBackButtonDispatcher(),
      scrollBehavior: CustomScrollBehavior(),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }

}
