import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String home = '/home';
  static const String splash = '/splash';
  static const String onBoarding = '/onboarding';
  static const String signIn = '/signIn';
  static const String signUp = '/signup';
  static const String forgetPass = '/forgetpass';
  static const String myProfileScreen = '/myprofile';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) {
          return const Scaffold(
            body: Center(child: Text('Welcome to Tripora')),
          );
        },
      ),
    ],
  );
}
