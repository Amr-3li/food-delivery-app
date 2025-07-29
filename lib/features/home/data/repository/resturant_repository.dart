import 'package:dartz/dartz.dart';
import 'package:restaurant/core/network/api_response.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/home/data/models/restaurant_details_model.dart';
import 'package:restaurant/features/home/data/models/restaurants_model.dart';

class RestaurantRepository {
  static final RestaurantRepository _instance =
      RestaurantRepository._internal();
  factory RestaurantRepository() {
    return _instance;
  }
  RestaurantRepository._internal();

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, RestaurantsModel>> fetchRestaurants() async {
    try {
      final response = await apiHelper.getRequest(
          endPoint: EndPoints.getRestaurants,
          isProtected: true
      );

      if (response.data != null) {
        RestaurantsModel restaurantsModel =
            RestaurantsModel.fromJson(response.data);
        return Right(restaurantsModel);
      } else {
        return Left("Failed to load restaurants");
      }
    } catch (error) {
      ApiResponse errorResponse = ApiResponse.fromError(error);
      return Left(errorResponse.message);
    }

  }

  Future<Either<String, RestaurantDetailsModel>> getRestaurantDetails({required int id}) async {
    try {
      final response = await apiHelper.getRequest(
          endPoint: '${EndPoints.getRestaurantDetails}/$id',
          isProtected: true
      );

      if (response.data != null) {
        RestaurantDetailsModel restaurantDetailsModel =
        RestaurantDetailsModel.fromJson(response.data);
        return Right(restaurantDetailsModel);
      } else {
        return Left("Failed to load restaurant datails");
      }
    } catch (error) {
      ApiResponse errorResponse = ApiResponse.fromError(error);
      return Left(errorResponse.message);
    }

  }
}
