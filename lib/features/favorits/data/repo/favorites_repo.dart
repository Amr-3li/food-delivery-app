import 'package:dartz/dartz.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';
import '../../../home/data/repository/meal_details_repository.dart';
import '../models/favorites_model.dart';

class FavoritesRepo {
  static final FavoritesRepo _instance = FavoritesRepo._internal();
  factory FavoritesRepo() => _instance;
  FavoritesRepo._internal();

  final ApiHelper apiHelper = ApiHelper();
  final MealDetailsRepository mealRepo = MealDetailsRepository();

  Future<Either<String, FavoritesModel>> getFavorites() async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: EndPoints.getFavorites,
        isProtected: true,
      );

      if (response.data != null) {
        FavoritesModel favoritesModel = FavoritesModel.fromJson(response.data);
        return Right(favoritesModel);
      } else {
        return Left('Failed to Get Favorites.');
      }
    } catch (e) {
      final ApiResponse errorResponse = ApiResponse.fromError(e);
      return Left(errorResponse.message);
    }
  }

  Future<Either<String, String>> addToFavorites(int dishId) {
    return mealRepo.addToFavorites(dishId: dishId);
  }

  Future<Either<String, String>> deleteFromFavorites(int dishId) {
    return mealRepo.deleteFromFavorites(dishId: dishId);
  }
}
