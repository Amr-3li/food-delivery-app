import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant/core/helper/exptions.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/models/food_details.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/models/item_image.dart';
import 'package:restaurant/features/chief_part/add_new_item/data/repository/meal_repository.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/food_cubit/food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  final MealRepository _mealRepository;

  FoodCubit(this._mealRepository) : super(FoodLoaded(FoodDetails()));

  void resetForm() {
    emit(FoodInitial(FoodDetails()));
  }

  void updateName(String name) {
    if (state is FoodLoaded) {
      final currentState = state as FoodLoaded;
      emit(FoodLoaded(currentState.foodDetails.copyWith(name: name)));
    }
  }

  void updateFoodType(int type) {
    if (state is FoodLoaded) {
      final currentState = state as FoodLoaded;
      emit(FoodLoaded(currentState.foodDetails.copyWith(categoryId: type)));
    }
  }

  void updateImages(List<ItemImage> images) {
    if (state is FoodLoaded) {
      final currentState = state as FoodLoaded;
      emit(FoodLoaded(currentState.foodDetails.copyWith(images: images)));
    }
  }

  void updateDeliveryType(String deliveryType) {
    if (state is FoodLoaded) {}
  }

  void updateDescription(String description) {
    if (state is FoodLoaded) {
      final currentState = state as FoodLoaded;
      emit(
        FoodLoaded(currentState.foodDetails.copyWith(description: description)),
      );
    }
  }

  void _showToast(String message, {bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> _attemptSave(FoodDetails food) async {
    try {
      if (food.images.isEmpty)
        throw ValidationException('Please add at least one image');
      await _mealRepository.createMeal(
        name: food.name,
        description: food.description,
        imagePath: food.images.first.file.path,
        price: food.price,
        categoryId: food.categoryId,
        isAvailable: food.isAvailable,
      );

      _showToast('Meal saved successfully!');
      emit(FoodSuccess(food));
    } on DioException catch (e) {
      final responseData = e.response?.data;
      String errorMessage = 'Network request failed';

      if (responseData != null && responseData is Map) {
        errorMessage =
            responseData['message'] ??
            responseData['error'] ??
            'Unknown server error';
      }

      throw NetworkException(errorMessage);
    }
  }

  Future<void> saveFoodDetails() async {
    try {
      // Validate state
      if (state is! FoodLoaded) {
        _showToast('Please fill out the form before saving.', isError: true);
        return; // Stop the function if state is not FoodLoaded
      }
      final food = (state as FoodLoaded).foodDetails;

      // Validate fields
      _validateFoodDetails(food);

      emit(FoodLoading(food));

      // Attempt to save
      await _attemptSave(food);
    } on ValidationException catch (e) {
      _showToast(e.message, isError: true);
      emit(FoodError(e.message, state.foodDetails));
    } on NetworkException catch (e) {
      _showToast('Network error: ${e.message}', isError: true);
      emit(FoodError('Network error', state.foodDetails));
    } on ServerException catch (e) {
      _showToast('Server error (${e.statusCode}): ${e.message}', isError: true);
      emit(FoodError('Server error', state.foodDetails));
    } catch (e, stackTrace) {
      debugPrint('Unexpected error: $e\n$stackTrace');
      _showToast('Unexpected error occurred', isError: true);
      emit(FoodError('Unexpected error', state.foodDetails));
    }
  }

  void _validateFoodDetails(FoodDetails food) {
    if (food.name.isEmpty) {
      throw ValidationException('Please enter a meal name');
    }
    if (food.description.isEmpty) {
      throw ValidationException('Please enter a description');
    }
    if (food.price <= 0) {
      throw ValidationException('Please enter a valid price');
    }
    if (food.images.isEmpty) {
      throw ValidationException('Please add at least one image');
    }
  }
}
