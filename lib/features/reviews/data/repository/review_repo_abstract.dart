import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';
import '../models/get_reviews_model.dart';

abstract class ReviewRepository {
  Future<Either<String, GetReviewsModel>> getDishReviews({required int dishId});
  Future<Either<String, String>> addDishReviews({required int dishId, required int rating, required String comment});
  Future<Either<String, List<Datum>>> getMyReviews();
}
