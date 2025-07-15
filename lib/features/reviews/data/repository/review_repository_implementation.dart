import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/features/reviews/data/api_services/review_api_services.dart';
import 'package:restaurant/features/reviews/data/models/add_review_model.dart';
import 'package:restaurant/features/reviews/data/models/review_model.dart';
import 'package:restaurant/features/reviews/data/repository/review_repo_abstract.dart';

class ReviewsRepositoryImplementation extends ReviewRepository {
  final ReviewsApiService apiService;

  ReviewsRepositoryImplementation(this.apiService);

  @override
  Future<Either<Failure, List<ReviewModel>>> getReviews() async {
    try {
      final reviews = await apiService.fetchReviews();
      return Right(reviews);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addReview(AddReviewRequest request) async {
    try {
      await apiService.postReview(request);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(errorMessage: e.toString()));
    }
  }
}
