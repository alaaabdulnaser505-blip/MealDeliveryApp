import "../../../core/models/recipe_model.dart";

sealed class SearchState {}

class SearchInitial extends SearchState {
  final List<RecipeModel> popularSearches;
  SearchInitial(this.popularSearches);
}

class SearchSuggestions extends SearchState {
  final List<RecipeModel> suggestions;
  final String query;
  SearchSuggestions({required this.suggestions, required this.query});
}

class SearchResults extends SearchState {
  final List<RecipeModel> results;
  final String query;
  SearchResults({required this.results, required this.query});
}

class SearchError extends SearchState {
  final String errorMessage;
  SearchError(this.errorMessage);
}