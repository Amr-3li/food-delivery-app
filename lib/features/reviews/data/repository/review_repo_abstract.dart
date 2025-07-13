import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/features/reviews/data/models/add_review_model.dart';
import 'package:restaurant/features/reviews/data/models/review_model.dart';

abstract class ReviewRepository {
  Future<Either<Failure, List<ReviewModel>>> getReviews();
  Future<Either<Failure, Unit>> addReview(AddReviewRequest request);
}
