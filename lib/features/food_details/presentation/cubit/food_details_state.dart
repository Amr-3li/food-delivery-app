import 'package:restaurant/features/food_details/data/food_details_model.dart';

abstract class FoodDetailsState {}

class FoodDetailsInitial extends FoodDetailsState {}

class FoodDetailsLoading extends FoodDetailsState {}

class FoodDetailsLoaded extends FoodDetailsState {
  final FoodDetailsModel food;

  FoodDetailsLoaded(this.food);
}

class FoodDetailsError extends FoodDetailsState {
  final String message;

  FoodDetailsError(this.message);
}
