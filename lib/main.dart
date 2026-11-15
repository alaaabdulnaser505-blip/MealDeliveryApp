import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripora/profile/cubit/profile_cubit.dart';
import 'package:tripora/profile/my_profile_screen.dart';

import 'package:tripora/profile/profile_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(
    BlocProvider(create: (_) => ProfileCubit(), child: const TriporaApp()),
  );
}

class TriporaApp extends StatelessWidget {
  const TriporaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),

      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      routes: {
        '/profile': (context) => const ProfileScreen(),
        '/myprofile': (context) => const MyProfileScreen(),
      },
    );
  }
}
