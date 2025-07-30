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

final class MealAddToFavoritesSuccess extends MealDetailsState {
  final String message;

  MealAddToFavoritesSuccess(this.message);
}

final class MealAddToFavoritesFailure extends MealDetailsState {
  final String error;

  MealAddToFavoritesFailure(this.error);
}

final class MealDeleteFromFavoritesSuccess extends MealDetailsState {
  final String message;

  MealDeleteFromFavoritesSuccess(this.message);
}

final class MealDeleteFromFavoritesFailure extends MealDetailsState {
  final String error;

  MealDeleteFromFavoritesFailure(this.error);
}