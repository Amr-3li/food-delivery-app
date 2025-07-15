import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/repository/meal_repository.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart'; // ✅ Required for MediaType

import 'meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final ApiHelper _apiHelper;

  MealRepositoryImpl(this._apiHelper);

  @override
  Future<void> createMeal({
    required String name,
    required String description,
    required String imagePath,
    required double price,
    required int categoryId,
    required bool isAvailable,
  }) async {
    final file = await MultipartFile.fromFile(
      imagePath,
      filename: imagePath.split('/').last,
      contentType: MediaType('image', 'jpeg'), // ✅ must match real image type
    );

    final data = FormData.fromMap({
      'name': name,
      'description': description,
      'category_id': categoryId.toString(),
      'image': file, // ✅ send image as file
      'is_available': isAvailable ? '1' : '0',
      'ingredients[0]': 1, // ✅ hardcoded valid ingredient ID for now
      'sizes[0][size]': 'medium',
      'sizes[0][price]': price.toString(),
    });

    await _apiHelper.postRequest(
      endPoint: EndPoints.meals,
      data: data,
      isFormData: true,
      isProtected: true,
    );
  }
}
