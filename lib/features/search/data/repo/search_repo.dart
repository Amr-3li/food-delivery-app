import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/features/search/data/model/popular_fast_food_model.dart';
import 'package:restaurant/features/search/data/model/search_model.dart';
import 'package:restaurant/features/search/data/model/suggested_restaurants_model.dart';

abstract class SearchRepo {
  Future<Either<String, List<SearchModel>>> searchRequest({
    required String search,
  });

  Future<Either<String, SuggestedRestaurantsModel>> getSuggestedRestaurants();

  Future<Either<String, PopularFastFoodModel>> getPopularFood();
}
