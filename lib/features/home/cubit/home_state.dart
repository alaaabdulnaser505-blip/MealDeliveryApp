import '../../../core/models/recipe_model.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<RecipeModel> recipes;
  final List<RecipeModel> mainCourses;
  final List<RecipeModel> appetizers;
  final List<RecipeModel> sideDishes;

  HomeSuccess({
    required this.recipes,
    required this.mainCourses,
    required this.appetizers,
    required this.sideDishes});
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}


