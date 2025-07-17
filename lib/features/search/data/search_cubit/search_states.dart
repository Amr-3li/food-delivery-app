import 'package:restaurant/features/search/data/search_model/search_model.dart';

class SearchStates {}

class InitialState extends SearchStates {}

class LoadingState extends SearchStates {}

class SuccessSearch extends SearchStates {
  final List<SearchModel> results;
  SuccessSearch({required this.results});
}

class FailureState extends SearchStates {
  final String errorMessage;
  FailureState({required this.errorMessage});
}
