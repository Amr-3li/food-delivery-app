import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';

abstract class FoodListRepository {
  Future<MealApiResponse> fetchFoodItems();
}
