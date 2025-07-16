import 'dart:convert';
import 'package:dio/dio.dart';
import 'food_model.dart';

class FoodRepository {
  final Dio _dio = Dio();

  Future<List<FoodModel>> getAllFoods() async {
    try {
      final response = await _dio.get(
        'https://round41-mobile-food.digital-vision-solutions.com/api/categories',
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        List data = response.data['data'];
        return data.map((item) => FoodModel.fromJson(item)).toList();
      } else {
        throw Exception(response.data['message'] ?? 'Something went wrong');
      }
    } catch (e) {
      throw Exception('Failed to load foods: $e');
    }
  }
}
