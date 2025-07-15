import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';

abstract class FoodListState {
  const FoodListState();
}

class FoodListInitial extends FoodListState {}

class FoodListLoading extends FoodListState {}

class FoodListLoaded extends FoodListState {
  final List<Meal> foodItems;
  final int totalItems;

  const FoodListLoaded(this.foodItems, this.totalItems);
}

class FoodListError extends FoodListState {
  final String message;

  const FoodListError(this.message);
}
