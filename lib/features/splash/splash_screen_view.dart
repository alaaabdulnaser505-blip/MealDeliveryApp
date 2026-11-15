import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripora/core/routing/app_routes.dart';
import 'package:tripora/features/splash/splash_screen2_view.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  
  @override
  void initState() {
  

  Future.delayed(const Duration(microseconds: 1500), () {
   if (!mounted) return;

    context.go(AppRouter.splash2);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
