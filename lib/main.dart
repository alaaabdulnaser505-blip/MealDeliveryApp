import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tripora/firebase_options.dart';
import 'package:tripora/features/profile/my_profile_screen.dart';
import 'package:tripora/features/profile/profile_screen.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const TriporaApp());
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
