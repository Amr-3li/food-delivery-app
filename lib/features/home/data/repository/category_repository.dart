import 'package:dartz/dartz.dart';
import 'package:restaurant/core/network/api_response.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/core/utils/constant_text.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/home/data/models/category_details_model.dart';
import 'package:restaurant/features/home/data/models/category_model.dart';
import 'package:restaurant/features/home/data/models/meals_types_details.dart';

class CategoryRepository {
  CategoryRepository();
  ApiHelper apiHelper = ApiHelper();

  Future<Either<Failure, List<CategoryHomeModel>>> getAllCategories() async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: EndPoints.categories,
        isProtected: true,
      );

      final data = response.data['data'] as List;
      final categories = data
          .map((e) => CategoryHomeModel.fromJson(e))
          .toList();
      return Right(categories);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
  Future<Either<String, CategoryDetailsModel>> getCategoryDetails({required int id}) async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: '${EndPoints.categories}/$id/dishes' ,
        isProtected: true,
      );

      if (response.data != null) {
        CategoryDetailsModel categoryDetailsModel = CategoryDetailsModel.fromJson(response.data);
        
        return Right(categoryDetailsModel);
      } else {
        return Left('Failed to Get Category Items.');
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }

  Future<Either<String, MealsTypeDetialsModel>> getMealsTypeDetails({required String mealType}) async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: '${EndPoints.mealsType}/$mealType' ,
        isProtected: true,
      );

      if (response.data != null) {
        MealsTypeDetialsModel mealsTypeDetialsModel = MealsTypeDetialsModel.fromJson(response.data);

        return Right(mealsTypeDetialsModel);
      } else {
        return Left('Failed to Get Meals Items.');
      }
    } catch (e) {
      ApiResponse apiResponse = ApiResponse.fromError(e);
      return Left(apiResponse.message);
    }
  }
}
