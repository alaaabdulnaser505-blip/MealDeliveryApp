
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tripora/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:tripora/features/auth/sign_in/cubit/signin_cubit.dart';

import 'package:tripora/features/auth/sign_in/signin_screen_view.dart';
import 'package:tripora/features/auth/sign_up/cubit/signup_cubit.dart';
import 'package:tripora/features/auth/sign_up/sign_up_screen.dart';
import 'package:tripora/features/on_boarding/onboarding_screen_view.dart';
import 'package:tripora/features/splash/splash_screen2_view.dart';
import 'package:tripora/features/splash/splash_screen_view.dart';

class AppRouter {
  static const String home = '/home';
  static const String splash = '/splash';
  static const String splash2 = '/splash2';
  static const String onBoarding = '/onboarding';
  static const String signIn = '/signIn';
  static const String signUp = '/signup';
  static const String forgotPassword = '/forgotPassword';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) {
     return SplashScreenView();     
        },
      ),
      GoRoute(path:splash2,builder:(context, state){ return SplashScreen2View( );} ),
      GoRoute(path: onBoarding,builder: (context, state) => OnboardingPage(),),
      GoRoute(path: signUp,builder: (context, state) => BlocProvider(
        create: (context)=>SignUpCubit(),  
         child: const SignUpScreen(),   
      )),
      GoRoute(path: signIn,builder: (context, state) => BlocProvider(
    create:   (context)=>SignInCubit(),    
        child: SignInScreen())
      ,),
      GoRoute(
  path: AppRouter.forgotPassword,
  builder: (context, state) => BlocProvider(
    create: (context) => SignInCubit(),
    child: const ForgotPasswordScreen(),
  ),
),
    ],
  );
}
