import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/api_response.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/search/data/model/popular_fast_food_model.dart';
import 'package:restaurant/features/search/data/model/search_model.dart';
import 'package:restaurant/features/search/data/model/suggested_restaurants_model.dart';
import 'package:restaurant/features/search/data/repo/search_repo.dart';

import '../../../../core/cache/cache_data.dart';

class SearchRepoImplementation extends SearchRepo {
  static final SearchRepoImplementation _instance =
      SearchRepoImplementation._internal();
  factory SearchRepoImplementation() {
    return _instance;
  }
  SearchRepoImplementation._internal();

  ApiHelper apiHelper = ApiHelper();
  Dio dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json', // Add default content-type
      },
    ),
  );

  @override
  Future<Either<String, List<SearchModel>>> searchRequest({
    required String search,
  }) async {
    try {
      final response = await dio.get(
        '${EndPoints.searchPage}$search',
        options: Options(
          headers: {'Authorization': 'Bearer ${CacheData.accessToken}'},
        ),
      );

      if (response.data != null) {
        if (response.data.isNotEmpty) {
          List<SearchModel> result = [];

          for (var item in response.data) {
            result.add(SearchModel.fromJson(item));
          }
          return Right(result);
        } else {
          return Left('Failed to Get Searched Items.');
        }
      } else {
        return Left('Failed to Get Searched Items.');
      }
    } catch (e, stackTrace) {
      debugPrint('Error adding new address: $e');
      debugPrint('StackTrace: $stackTrace');
      return Left("An unexpected error occurred.");
    }
  }

  @override
  Future<Either<String, PopularFastFoodModel>> getPopularFood() async {
    try {
      ApiResponse apiResponse = await apiHelper.getRequest(
        endPoint: EndPoints.popularMeals,
        isProtected: true,
      );

      if (apiResponse.data != null) {
        PopularFastFoodModel popularFastFoodModel =
            PopularFastFoodModel.fromJson(apiResponse.data);
        return Right(popularFastFoodModel);
      } else {
        return Left('Failed to Get Popular Fast Food.');
      }
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.fromError(error);
      return Left(apiResponse.message);
    }
  }

  @override
  Future<Either<String, SuggestedRestaurantsModel>>
  getSuggestedRestaurants() async {
    try {
      ApiResponse apiResponse = await apiHelper.getRequest(
        endPoint: EndPoints.suggestedResturants,
        isProtected: true,
      );

      if (apiResponse.data != null) {
        SuggestedRestaurantsModel suggestedRestaurantsModel =
            SuggestedRestaurantsModel.fromJson(apiResponse.data);
        return Right(suggestedRestaurantsModel);
      } else {
        return Left('Failed to Get Suggested Restaurants.');
      }
    } catch (error) {
      ApiResponse apiResponse = ApiResponse.fromError(error);
      return Left(apiResponse.message);
    }
  }
}
