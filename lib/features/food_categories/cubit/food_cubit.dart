import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant/features/food_categories/data/food_repository.dart';
import 'food_state.dart';

class FoodUserCubit extends Cubit<FoodUserState> {
  final FoodUserRepository foodRepository;

  FoodUserCubit(this.foodRepository) : super(FoodUserSInitial());

  Future<void> fetchAllFoods() async {
    emit(FoodUserSLoading());
    final result = await foodRepository.getAllFoods();
    result.fold(
      (failure) => emit(FoodUserSFailure(failure.errorMessage)),
      (foods) => emit(FoodUserSSuccess(foods)),
    );
  }

  Future<void> fetchFoodsByCategoryId(int id) async {
    emit(FoodUserSLoading());
    final result = await foodRepository.getFoodsDetails(id: id);
    result.fold(
      (failure) => emit(FoodUserSFailure(failure.errorMessage)),
      (foods) => emit(FoodUserSSuccess(foods)),
    );
  }
}
