import "package:flutter_bloc/flutter_bloc.dart";
import "package:tripora/core/datasource/firebase_datasource.dart";
import "../../../core/models/recipe_model.dart";
import "search_state.dart";

class SearchCubit extends Cubit<SearchState> {
  final List<RecipeModel> allRecipes;

  SearchCubit({required this.allRecipes})
      : super(SearchInitial(allRecipes.take(6).toList()));

  List<RecipeModel> get _popularList => allRecipes.take(6).toList();
  List<RecipeModel> _filter(String query) {
    return allRecipes
        .where((recipe) =>
        recipe.dishName.toLowerCase().contains(query.toLowerCase().trim()))
        .toList();
  }
  void onQueryChanged(String query) {
    if (query.trim().isEmpty) {
      emit(SearchInitial(_popularList));
    } else {
      final filtered = _filter(query);
      emit(SearchSuggestions(suggestions: filtered, query: query));
    }
  }
  void submitSearch(String query) {
    if (query.trim().isEmpty) {
      emit(SearchInitial(_popularList));
      return;
    }
    final filtered = _filter(query);
    emit(SearchResults(results: filtered, query: query.trim()));
  }
  void clearSearch() {
    emit(SearchInitial(_popularList));
  }
}