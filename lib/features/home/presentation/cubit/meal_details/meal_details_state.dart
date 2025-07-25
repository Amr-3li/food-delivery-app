part of 'meal_details_cubit.dart';

@immutable
sealed class MealDetailsState {}

final class MealDetailsInitial extends MealDetailsState {}

final class MealDetailsSuccess extends MealDetailsState {}

final class MealDetailsFailure extends MealDetailsState {
  final String error;

  MealDetailsFailure(this.error);
}

final class MealDetailsChangeSize extends MealDetailsState {}