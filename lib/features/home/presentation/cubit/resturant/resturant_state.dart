

abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {}

class GetRestaurantsSuccess extends RestaurantState {}

class GetRestaurantsError extends RestaurantState {
  final String message;

  GetRestaurantsError(this.message);
}

class SelectCategorySuccess extends RestaurantState {}
