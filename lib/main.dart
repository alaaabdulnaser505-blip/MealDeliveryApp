import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripora/core/datasource/firebase_datasource.dart';
import 'package:tripora/core/routing/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/home/home_screen.dart';
import 'features/search/search_screen.dart';
import 'features/trending_recipes/trending_recipes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();
  // await firebaseDataSource.addRecipes();
  runApp(const MealDeliveryApp());
}

class MealDeliveryApp extends StatelessWidget {
  const MealDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: BlocProvider(
          create: (context) => HomeCubit()..getRecipes(),
          child: HomeScreen(),
        ),
        routes: {
          "home": (context) =>
              BlocProvider(
                create: (context) =>
                HomeCubit()
                  ..getRecipes(),
                child: HomeScreen(),
              ),
          "trending_recipes": (context) =>
              BlocProvider(
                  create: (context) =>
                  HomeCubit()
                    ..getRecipes(),
                  child: TrendingRecipes(
                      recipeList: FirebaseDataSource().meals)),
          "search": (context) => SearchScreen(allRecipes: FirebaseDataSource().meals,)
        }
      // routerConfig: AppRouter.router,
    );
  }
}

