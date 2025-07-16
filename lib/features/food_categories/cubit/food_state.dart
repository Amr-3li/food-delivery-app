import 'package:restaurant/features/food_categories/data/food_model.dart';

abstract class FoodUserState {}

class FoodUserSInitial extends FoodUserState {}

class FoodUserSLoading extends FoodUserState {}

class FoodUserSSuccess extends FoodUserState {
  final List<FoodModel> foods;

  FoodUserSSuccess(this.foods);
}

class FoodUserSFailure extends FoodUserState {
  final String error;

  FoodUserSFailure(this.error);
}
