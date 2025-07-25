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
}