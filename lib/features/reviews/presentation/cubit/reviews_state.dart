part of 'reviews_cubit.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class GetReviewsSuccess extends ReviewsState {}

final class GetReviewsError extends ReviewsState {
  final String errorMessage;

  GetReviewsError(this.errorMessage);
}

final class AddReviewSuccess extends ReviewsState {
  final String message;

  AddReviewSuccess(this.message);
}

final class AddReviewError extends ReviewsState {
  final String errorMessage;

  AddReviewError(this.errorMessage);
}
