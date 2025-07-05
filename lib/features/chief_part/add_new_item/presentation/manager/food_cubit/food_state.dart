import 'package:restaurant/features/chief_part/add_new_item/data/models/food_details.dart';

abstract class FoodState {
  FoodDetails get foodDetails;
}

class FoodInitial extends FoodState {
  @override
  final FoodDetails foodDetails;

  FoodInitial(this.foodDetails);
}

class FoodLoaded extends FoodState {
  @override
  final FoodDetails foodDetails;

  FoodLoaded(this.foodDetails);
}

class FoodError extends FoodState {
  final String message;
  @override
  final FoodDetails foodDetails;

  FoodError(this.message, this.foodDetails);
}
