import 'package:restaurant/features/search/data/model/search_model.dart';

class SearchStates {}

class InitialState extends SearchStates {}

class SearchSuccessState extends SearchStates {}

class SearchErrorState extends SearchStates {
  final String error;

  SearchErrorState(this.error);
}

class GetPopularFoodSuccessState extends SearchStates {}

class GetPopularFoodErrorState extends SearchStates {
  final String error;

  GetPopularFoodErrorState(this.error);
}

class GetSuggestedRestaurantsSuccessState extends SearchStates {}

class GetSuggestedRestaurantsErrorState extends SearchStates {
  final String error;

  GetSuggestedRestaurantsErrorState(this.error);
}