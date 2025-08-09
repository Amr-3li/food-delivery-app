import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/search/data/model/popular_fast_food_model.dart';
import 'package:restaurant/features/search/data/model/search_model.dart';
import 'package:restaurant/features/search/data/model/suggested_restaurants_model.dart';
import 'package:restaurant/features/search/presentation/manger/search/search_states.dart';

import '../../../data/repo/search_repo.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super(InitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  List<SearchModel>? result;

  void searchRequest({required String search}) async {
    emit(InitialState());
    final result = await searchRepo.searchRequest(search: search);
    result.fold((error) => emit(SearchErrorState(error)), (result) {
      emit(SearchSuccessState());
      this.result = result;
    });
  }

  PopularFastFoodModel? popularFastFoodModel;

  void getPopularFood() async {
    if (popularFastFoodModel == null) {
      final result = await searchRepo.getPopularFood();
      result.fold((error) => emit(GetPopularFoodErrorState(error)), (
          popularFastFoodModel,
          ) {
        emit(GetPopularFoodSuccessState());
        this.popularFastFoodModel = popularFastFoodModel;
      });
    } else {
      emit(GetPopularFoodSuccessState());
    }
  }

  SuggestedRestaurantsModel? suggestedRestaurantsModel;

  void getSuggestedRestaurants() async {
    if (suggestedRestaurantsModel == null) {
      final result = await searchRepo.getSuggestedRestaurants();
      result.fold((error) => emit(GetSuggestedRestaurantsErrorState(error)), (
          suggestedRestaurantsModel,
          ) {
        emit(GetSuggestedRestaurantsSuccessState());
        this.suggestedRestaurantsModel = suggestedRestaurantsModel;
      });
    } else {
      emit(GetSuggestedRestaurantsSuccessState());
    }
  }
}
