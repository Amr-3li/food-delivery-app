part of 'chef_reviews_cubit.dart';

abstract class ChefReviewsState {
  const ChefReviewsState();
}

class ChefReviewsInitial extends ChefReviewsState {}

class ChefReviewsLoading extends ChefReviewsState {}

class ChefReviewsLoaded extends ChefReviewsState {
  final double averageRating;
  final int totalReviews;

  const ChefReviewsLoaded({
    required this.averageRating,
    required this.totalReviews,
  });
}

class ChefReviewsError extends ChefReviewsState {
  final String message;

  const ChefReviewsError({required this.message});
}
