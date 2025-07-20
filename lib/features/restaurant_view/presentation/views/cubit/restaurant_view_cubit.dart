import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/restaurant_view/data/restaurant_view_repository.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/cubit/restaurant_view_state.dart';

class RestaurantViewCubit extends Cubit<RestaurantViewState> {
  final RestaurantViewRepository repository;

  RestaurantViewCubit(this.repository) : super(RestaurantViewInitial());

  void getRestaurantView(int id) async {
    try {
      emit(RestaurantViewLoading());
      final data = await repository.fetchRestaurantView(id);

      // Get the first category if available, else fallback
      // final CategoryModel? defaultCategory = (data.categories.isNotEmpty)
      //     ? data.categories.first
      //     : null;

      emit(
        RestaurantViewLoaded(
          restaurantView: data,
          // selectedCategory: defaultCategory,
        ),
      );
    } catch (e) {
      emit(RestaurantViewError(e.toString()));
    }
  }

  // void selectCategory(CategoryModel? category) {
  //   final currentState = state;
  //   if (currentState is RestaurantViewLoaded) {
  //     emit(currentState.copyWith(selectedCategory: category));
  //   }
  // }

  // RestaurantViewModel? get currentRestaurantViewModel {
  //   final currentState = state;
  //   if (currentState is RestaurantViewLoaded) {
  //     return currentState.restaurantView;
  //   }
  //   return null;
  // }
}
