// food_list_cubit.dart
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/repository/food_list_repository.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/cubit/food_list_state.dart';

class FoodListCubit extends Cubit<FoodListState> {
  final FoodListRepository repository;

  FoodListCubit(this.repository) : super(FoodListInitial());

  Future<void> fetchFoodItems() async {
    emit(FoodListLoading());
    try {
      final response = await repository.fetchFoodItems();
      if (response.data.isEmpty) {
        emit(FoodListError('No food items available'));
      } else {
        emit(FoodListLoaded(response.data, response.meta.total));
      }
    } catch (e) {
      // Handle the case where message contains "success" but is thrown as error
      if (e.toString().contains('retrieved successfully')) {
        // Try to parse the response anyway
        try {
          final json = jsonDecode(e.toString().replaceFirst('Exception: ', ''));
          final response = MealApiResponse.fromJson(json);
          emit(FoodListLoaded(response.data, response.meta.total));
        } catch (_) {
          emit(FoodListError(e.toString()));
        }
      } else {
        emit(FoodListError(e.toString()));
      }
    }
  }
}
