import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/restaurant_view/data/restaurant_view_model.dart';
import 'package:restaurant/features/restaurant_view/data/restaurant_view_repository.dart';
import 'restaurant_view_state.dart';

class RestaurantViewCubit extends Cubit<RestaurantViewState> {
  final RestaurantViewRepository repository;

  RestaurantViewCubit(this.repository) : super(RestaurantViewInitial());

  void getRestaurantView() async {
    try {
      emit(RestaurantViewLoading());
      final data = await repository.fetchRestaurantView();
      final defaultCategory = data.categories.first;
      emit(RestaurantViewLoaded(
        restaurantView: data,
        selectedCategory: defaultCategory,
      ));
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
}
