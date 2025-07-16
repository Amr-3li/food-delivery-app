import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/food_details/data/food_details_repository.dart';
import 'package:restaurant/features/food_details/presentation/cubit/food_details_state.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  final FoodDetailsRepository repository;

  FoodDetailsCubit(this.repository) : super(FoodDetailsInitial());

  Future<void> fetchFoodDetails() async {
    emit(FoodDetailsLoading());

    try {
      final food = await repository.fetchFoodDetails();
      emit(FoodDetailsLoaded(food));
    } catch (e) {
      emit(FoodDetailsError(e.toString()));
    }
  }
}

