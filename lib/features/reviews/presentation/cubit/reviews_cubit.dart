import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant/features/reviews/data/models/get_reviews_model.dart';
import 'package:restaurant/features/reviews/data/repository/review_repo_abstract.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this.reviewRepository) : super(ReviewsInitial());
  final ReviewRepository reviewRepository;

  static ReviewsCubit get(context) => BlocProvider.of(context);

  GetReviewsModel? reviewsModel;

  void getDishReviews({required int dishId}) async {
    final result = await reviewRepository.getDishReviews(dishId: dishId);

    result.fold(
      (failure) => emit(GetReviewsError(failure)),
      (reviewsModel) {
        emit(GetReviewsSuccess());
        this.reviewsModel = reviewsModel;
      }
    );
  }

  void addDishReviews({
    required int dishId,
    required int rating,
    required String comment,
  }) async {
    final result = await reviewRepository.addDishReviews(
      dishId: dishId,
      rating: rating,
      comment: comment,
    );

    result.fold(
      (failure) => emit(AddReviewError(failure)),
      (message) {
        emit(AddReviewSuccess(message));
      }
    );
  }

  List<Datum> myReviewsModel = [];

  void getMyReviews() async {
    final result = await reviewRepository.getMyReviews();

    result.fold(
      (failure) => emit(GetReviewsError(failure)),
      (myReviewsModel) {
        emit(GetReviewsSuccess());
        this.myReviewsModel = myReviewsModel;
      }
    );
  }
}
