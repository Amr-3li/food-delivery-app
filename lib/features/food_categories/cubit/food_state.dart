import 'package:restaurant/features/food_categories/data/food_model.dart';

abstract class FoodState {}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodSuccess extends FoodState {
  final List<FoodModel> foods;

  FoodSuccess(this.foods);
}

class FoodFailure extends FoodState {
  final String error;

  FoodFailure(this.error);
}
