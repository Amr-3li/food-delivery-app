import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/repository/meal_repository.dart';

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
    final data = {
      'name': name,
      'description': description,
      'category_id': categoryId.toString(),
      'image': imagePath,
      'is_available': isAvailable ? '1' : '0',
      'ingredients[0]': 'salt', // Fixed as per requirements
      'sizes[0][size]': 'medium',
      'sizes[0][price]': price.toString(),
    };

    await _apiHelper.postRequest(
      endPoint: EndPoints.meals,
      data: data,
      isFormData: true, // Changed to true for file upload
      isProtected: true,
    );
  }
}
