import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/api_response.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/reviews/data/repository/review_repo_abstract.dart';
import '../models/get_reviews_model.dart';

class ReviewsRepositoryImplementation extends ReviewRepository {
  ReviewsRepositoryImplementation._internal();
  static final ReviewsRepositoryImplementation _instance = ReviewsRepositoryImplementation._internal();
  factory ReviewsRepositoryImplementation() {
    return _instance;
  }

  ApiHelper apiHelper = ApiHelper();

  @override
  Future<Either<String, GetReviewsModel>> getDishReviews({required int dishId}) async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: 'dishes/$dishId/reviews',
        isProtected: true,
      );

      if (response.data != null) {
        final GetReviewsModel reviewsModel = GetReviewsModel.fromJson(response.data);
        return right(reviewsModel);
      } else {
        return left("No reviews found for this dish.");
      }
    } catch (error) {
      ApiResponse errorResponse = ApiResponse.fromError(error);
      return left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, String>> addDishReviews({required int dishId, required int rating, required String comment}) async {
    try {
      final response = await apiHelper.postRequest(
        endPoint: EndPoints.reviews,
        data: {
          "dish_id": dishId,
          "rating": rating,
          "comment": comment
        },
        isProtected: true,
      );

      if (response.data != null) {
        return right(response.message);
      } else {
        return left("Failed to add review.");
      }
    } catch (error) {
      ApiResponse errorResponse = ApiResponse.fromError(error);
      return left(errorResponse.message);
    }
  }

  @override
  Future<Either<String, List<Datum>>> getMyReviews() async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: EndPoints.myReviews,
        isProtected: true,
      );

      if (response.data != null) {
        final List<Datum> myReviews = [];
        for (var item in response.data['data']['data']) {
          myReviews.add(Datum.fromJson(item));
        }

        return right(myReviews);

      } else {
        return left("Failed to load your reviews.");
      }
    } catch (e, stackTrace) {
      debugPrint('Error adding new address: $e');
      debugPrint('StackTrace: $stackTrace');
      return Left("An unexpected error occurred.");
    }
  }
}
