import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chief_part/home/data/repository/reviews/chef_reviews_repository.dart';

part 'chef_reviews_state.dart';

class ChefReviewsCubit extends Cubit<ChefReviewsState> {
  final BaseChefReviewsRepository repository;

  ChefReviewsCubit({required this.repository}) : super(ChefReviewsInitial());

  Future<void> fetchChefReviewsSummary(int chefId) async {
    emit(ChefReviewsLoading());
    try {
      final summary = await repository.getChefReviewsSummary(chefId);
      emit(
        ChefReviewsLoaded(
          averageRating: summary.averageRating,
          totalReviews: summary.totalReviews,
        ),
      );
    } catch (e) {
      emit(ChefReviewsError(message: e.toString()));
    }
  }
}
