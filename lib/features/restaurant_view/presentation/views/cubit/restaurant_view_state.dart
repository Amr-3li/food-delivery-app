import 'package:restaurant/features/restaurant_view/data/restaurant_view_model.dart';

abstract class RestaurantViewState {}

class RestaurantViewInitial extends RestaurantViewState {}

class RestaurantViewLoading extends RestaurantViewState {}

class RestaurantViewLoaded extends RestaurantViewState {
  final RestaurantViewModel restaurantView;
  final CategoryModel selectedCategory;

  RestaurantViewLoaded({
    required this.restaurantView,
    required this.selectedCategory,
  });

  RestaurantViewLoaded copyWith({
    RestaurantViewModel? restaurantView,
    CategoryModel? selectedCategory,
  }) {
    return RestaurantViewLoaded(
      restaurantView: restaurantView ?? this.restaurantView,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class RestaurantViewError extends RestaurantViewState {
  final String message;

  RestaurantViewError(this.message);
}

