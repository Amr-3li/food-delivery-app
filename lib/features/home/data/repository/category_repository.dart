import 'package:dartz/dartz.dart';
import 'package:restaurant/core/utils/constant_text.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/home/data/models/category_model.dart';

class CategoryRepository {
  CategoryRepository();
  ApiHelper apiHelper = ApiHelper();
  Future<Either<Failure, List<CategoryHomeModel>>> getAllCategories() async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: "${APIKey.baseApiUrl}/categories",
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
}
