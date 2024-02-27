
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphify_example/features/home/home_screen.dart';
import 'package:graphify_example/features/line/basic_line.dart';

final navigatorKey = GlobalKey<NavigatorState>();

GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: [

          GoRoute(
            path: '/',
            name: 'Home',
            builder: (context, state) => const HomeScreen(),
            routes: [

              GoRoute(
                  path: 'basic-line',
                  name: 'Basic Line',
                  builder: (context, state) => const BasicLineChart()
              ),

            ],
          ),



  ]
);


CustomTransitionPage pageBuilder<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
  );
}