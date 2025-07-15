import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';
import 'package:restaurant/features/reviews/data/models/add_review_model.dart';
import 'package:restaurant/features/reviews/data/models/review_model.dart';

import 'package:restaurant/features/reviews/data/repository/review_repository_implementation.dart';
import 'package:restaurant/features/reviews/presentation/cubit/review_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final ReviewsRepositoryImplementation repository;

  ReviewsCubit(this.repository) : super(ReviewsInitial());

  Future<void> fetchReviews() async {
    emit(ReviewsLoading());

    final Either<Failure, List<ReviewModel>> result = await repository
        .getReviews();

    result.fold(
      (failure) => emit(ReviewsError(failure.errorMessage)),
      (reviews) => emit(ReviewsLoaded(reviews)),
    );
  }

  Future<void> addReview(AddReviewRequest request) async {
    emit(ReviewsLoading());

    final result = await repository.addReview(request);

    result.fold(
      (failure) => emit(ReviewsError(failure.errorMessage)),
      (_) => fetchReviews(),
    );
  }

  Future<void> submitReview({
    required int dishId,
    required int rating,
    required String comment,
  }) async {
    if (comment.isEmpty || rating == 0) {
      emit(ReviewsError("Please fill all fields and provide a rating."));
      return;
    }

    emit(ReviewsLoading());

    final request = AddReviewRequest(
      dishId: dishId,
      rating: rating,
      comment: comment,
    );

    final result = await repository.addReview(request);

    result.fold(
      (failure) => emit(ReviewsError(failure.errorMessage)),
      (_) => fetchReviews(), // reload after success
    );
  }
}
