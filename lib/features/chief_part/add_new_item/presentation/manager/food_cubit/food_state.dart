import 'package:restaurant/features/chief_part/add_new_item/data/models/food_details.dart';

abstract class FoodState {
  FoodDetails get foodDetails;
}

class FoodInitial extends FoodState {
  final FoodDetails foodDetails;

  FoodInitial(this.foodDetails);
}

class FoodLoaded extends FoodState {
  final FoodDetails foodDetails;

  FoodLoaded(this.foodDetails);
}

class FoodError extends FoodState {
  final String message;
  final FoodDetails foodDetails;

  FoodError(this.message, this.foodDetails);
}
