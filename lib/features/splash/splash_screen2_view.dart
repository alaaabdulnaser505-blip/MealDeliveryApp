
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tripora/core/routing/app_routes.dart';

class SplashScreen2View extends StatefulWidget {
  const SplashScreen2View({super.key});

  @override
  State<SplashScreen2View> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2View>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
    Future.delayed(const Duration(milliseconds: 1500), () {
   if (!mounted) return;

    context.go(AppRouter.onBoarding);
  });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Image.asset(
                'assets/images/Logo.png',
                width: 300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
