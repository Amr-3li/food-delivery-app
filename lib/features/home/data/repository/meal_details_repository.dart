import 'package:dartz/dartz.dart';
import 'package:restaurant/features/home/data/models/meal_details_model.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';

class MealDetailsRepository {
  static final MealDetailsRepository _instance = MealDetailsRepository._internal();
  factory MealDetailsRepository() {
    return _instance;
  }
  MealDetailsRepository._internal();

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, MealDetailsModel>> getMealDetails({required int id}) async {
    try {
      ApiResponse apiResponse = await apiHelper.getRequest(
        endPoint: '${EndPoints.mealDetails}/$id',
        isProtected: true,
      );

      if (apiResponse.data != null) {
        MealDetailsModel mealDetailsModel = MealDetailsModel.fromJson(
          apiResponse.data,
        );
        return Right(mealDetailsModel);
      } else {
        return Left("Failed to Get Meal Details.");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  Future<Either<String, String>> addToFavorites({required int dishId}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
        endPoint: EndPoints.addToFavorites,
        isProtected: true,
        data: {
          "dish_id": dishId
        }
      );

      if (apiResponse.data != null) {
        return Right(apiResponse.message);
      } else {
        return Left("Failed to Add Dish To Favorites.");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  Future<Either<String, String>> deleteFromFavorites({required int dishId}) async {
    try {
      ApiResponse apiResponse = await apiHelper.deleteRequest(
          endPoint: '${EndPoints.removeFromFavorites}/$dishId',
          isProtected: true,
      );

      if (apiResponse.data != null) {
        return Right(apiResponse.message);
      } else {
        return Left("Failed to Add Dish To Favorites.");
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }


  Future<void> makeConversation({required int id}) async {
    try {
      ApiResponse apiResponse = await apiHelper.postRequest(
        endPoint: EndPoints.makeConversation,
        isProtected: true,
        data: {
          'receiver_id' : id
        },
        isFormData: true
      );

      if (!apiResponse.status) {
        throw Exception(apiResponse.message);
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      print(errorResponse.message);
      throw Exception(errorResponse.message);
    }
  }
}