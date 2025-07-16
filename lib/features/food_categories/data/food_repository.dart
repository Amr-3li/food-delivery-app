import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:restaurant/core/error/failure.dart';
import 'food_model.dart';

class FoodUserRepository {
  final Dio _dio = Dio();

  Future<Either<Failure, List<FoodModel>>> getAllFoods() async {
    try {
      final response = await _dio.get(
        'https://round41-mobile-food.digital-vision-solutions.com/api/categories',
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        List data = response.data['data'];
        final foods = data.map((item) => FoodModel.fromJson(item)).toList();
        return Right(foods);
      } else {
        return Left(
          Failure(
            errorMessage: response.data['message'] ?? 'Something went wrong',
          ),
        );
      }
    } catch (e) {
      return Left(Failure(errorMessage: 'Failed to load foods: $e'));
    }
  }

  Future<Either<Failure, List<FoodModel>>> getFoodsDetails({
    required int id,
  }) async {
    try {
      final response = await _dio.get(
        'https://round41-mobile-food.digital-vision-solutions.com/api/categories/$id',
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        final categoryData = response.data['data']['category'];
        final foodList = categoryData['foods'] as List;
        final foods = foodList.map((food) => FoodModel.fromJson(food)).toList();
        return Right(foods);
      } else {
        return Left(
          Failure(
            errorMessage: response.data['message'] ?? 'Something went wrong',
          ),
        );
      }
    } catch (e) {
      return Left(Failure(errorMessage: 'Failed to load food: $e'));
    }
  }
}
