import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/restaurant_view/data/restaurant_view_model.dart';
import 'package:restaurant/features/restaurant_view/data/restaurant_view_repository.dart';
import 'restaurant_view_state.dart';

class RestaurantViewCubit extends Cubit<RestaurantViewState> {
  final RestaurantViewRepository repository;

  RestaurantViewCubit(this.repository) : super(RestaurantViewInitial());

  Future<void> getRestaurantView() async {
    try {
      emit(RestaurantViewLoading());
      final RestaurantViewModel data = await repository.fetchRestaurantView();

      if (data.categories.isEmpty) {
        emit(RestaurantViewError('No categories available'));
        return;
      }

      final defaultCategory = data.categories.first;
      emit(
        RestaurantViewLoaded(
          restaurantView: data,
          selectedCategory: defaultCategory,
        ),
      );
    } catch (e) {
      emit(RestaurantViewError(e.toString()));
    }
  }

  Future<void> getFilteredRestaurantView({
    required int rate,
    required int price,
  }) async {
    try {
      emit(RestaurantViewLoading());
      final RestaurantViewModel data = await repository
          .fetchFilteredRestaurantView(rate, price);

      if (data.categories.isEmpty) {
        emit(RestaurantViewError('No categories available after filtering'));
        return;
      }

      final defaultCategory = data.categories.first;
      emit(
        RestaurantViewLoaded(
          restaurantView: data,
          selectedCategory: defaultCategory,
        ),
      );
    } catch (e) {
      emit(RestaurantViewError(e.toString()));
    }
  }

  void selectCategory(CategoryModel category) {
    final currentState = state;
    if (currentState is RestaurantViewLoaded) {
      emit(currentState.copyWith(selectedCategory: category));
    }
  }

  // Optional: Helper method to get the current restaurant view model
  RestaurantViewModel? get currentRestaurantViewModel {
    final currentState = state;
    if (currentState is RestaurantViewLoaded) {
      return currentState.restaurantView;
    }
    return null;
  }
}
