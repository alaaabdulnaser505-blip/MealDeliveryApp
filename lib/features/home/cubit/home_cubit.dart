import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/datasource/firebase_datasource.dart';
import '../../../core/models/recipe_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getRecipes() async {
    emit(HomeLoading());
    try {
      FirebaseDataSource firebaseDataSource = FirebaseDataSource();
      // List<RecipeModel> recipes = await firebaseDataSource.getRecipes();
      // List<RecipeModel> mainCourses = await firebaseDataSource.getMainCourses();
      // List<RecipeModel> appetizers = await firebaseDataSource.getAppetizers();
      // List<RecipeModel> sideDishes = await firebaseDataSource.getSideDishes();
      //
      // emit(HomeSuccess(
      //     recipes: recipes,
      //     mainCourses: mainCourses,
      //     appetizers: appetizers,
      //     sideDishes: sideDishes));
      final results = await Future.wait([
        firebaseDataSource.getRecipes(),
        firebaseDataSource.getMainCourses(),
        firebaseDataSource.getAppetizers(),
        firebaseDataSource.getSideDishes(),
      ]);

      emit(HomeSuccess(
        recipes: results[0] as List<RecipeModel>,
        mainCourses: results[1] as List<RecipeModel>,
        appetizers: results[2] as List<RecipeModel>,
        sideDishes: results[3] as List<RecipeModel>,
      ));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

}
