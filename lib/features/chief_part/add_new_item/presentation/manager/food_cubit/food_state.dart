import 'package:restaurant/features/chief_part/add_new_item/data/models/food_details.dart';

abstract class FoodState {
  FoodDetails get foodDetails;
}

class FoodInitial extends FoodState {
  @override
  final FoodDetails foodDetails;
  FoodInitial(this.foodDetails);
}

class FoodLoading extends FoodState {
  @override
  final FoodDetails foodDetails;
  FoodLoading(this.foodDetails);
}

class FoodLoaded extends FoodState {
  @override
  final FoodDetails foodDetails;
  FoodLoaded(this.foodDetails);
}

class FoodSuccess extends FoodState {
  @override
  final FoodDetails foodDetails;
  FoodSuccess(this.foodDetails);
}

class FoodError extends FoodState {
  @override
  final FoodDetails foodDetails;
  final String message;
  FoodError(this.message, this.foodDetails);
}
