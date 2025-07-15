import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/food_categories/data/food_model.dart';
import 'package:restaurant/features/food_categories/data/food_repository.dart';
import 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  final FoodRepository foodRepository;

  FoodCubit(this.foodRepository) : super(FoodInitial());

  Future<void> fetchAllFoods() async {
    emit(FoodLoading());
    try {
      final List<FoodModel> foods = await foodRepository.getAllFoods();
      emit(FoodSuccess(foods));
    } catch (e) {
      emit(FoodFailure(e.toString()));
    }
  }
}
