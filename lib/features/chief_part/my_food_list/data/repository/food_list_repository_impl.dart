// food_list_repository_impl.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/repository/food_list_repository.dart';

class FoodListRepositoryImpl implements FoodListRepository {
  final ApiHelper apiHelper;

  FoodListRepositoryImpl(this.apiHelper);

  @override
  Future<MealApiResponse> fetchFoodItems() async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: EndPoints.meals,
        isProtected: true,
      );

      debugPrint(
        'Raw API Response: ${response.data}',
      ); // Add this for debugging

      // Check if response contains data
      if (response.data != null && response.data['data'] != null) {
        return MealApiResponse.fromJson(response.data);
      } else {
        throw Exception('No data received from server');
      }
    } on DioException catch (e) {
      debugPrint('Dio Error: ${e.response?.data}');
      throw Exception(e.message ?? 'Failed to load food items');
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Failed to load food items: ${e.toString()}');
    }
  }
}
