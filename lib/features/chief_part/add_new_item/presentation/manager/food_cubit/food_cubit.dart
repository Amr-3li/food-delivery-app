import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/models/food_details.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/models/item_image.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/food_cubit/food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial(FoodDetails()));

  void resetForm() {
    emit(FoodInitial(FoodDetails()));
  }

  void updateName(String name) {
    if (state is FoodLoaded) {
      final currentState = state as FoodLoaded;
      emit(FoodLoaded(currentState.foodDetails.copyWith(name: name)));
    }
  }

  void updateImages(List<ItemImage> images) {
    if (state is FoodLoaded) {
      final currentState = state as FoodLoaded;
      emit(FoodLoaded(currentState.foodDetails.copyWith(images: images)));
    }
  }

  void updateDeliveryType(String deliveryType) {
    if (state is FoodLoaded) {
      final currentState = state as FoodLoaded;
      emit(
        FoodLoaded(
          currentState.foodDetails.copyWith(deliveryType: deliveryType),
        ),
      );
    }
  }

  void updateDescription(String description) {
    if (state is FoodLoaded) {
      final currentState = state as FoodLoaded;
      emit(
        FoodLoaded(currentState.foodDetails.copyWith(description: description)),
      );
    }
  }

  void saveFoodDetails() {
    if (state is FoodLoaded) {
      final food = (state as FoodLoaded).foodDetails;
      // Save to database or API
      debugPrint('Saving food: ${food.toMap()}');
    }
  }
}
