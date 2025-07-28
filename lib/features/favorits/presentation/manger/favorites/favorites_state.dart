part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}

final class GetFavoritesSuccess extends FavoritesState {}

final class GetFavoritesError extends FavoritesState {
  final String error;

  GetFavoritesError(this.error);
}

final class AddToFavoritesSuccess extends FavoritesState {
  final String message;

  AddToFavoritesSuccess(this.message);
}

final class AddToFavoritesFailure extends FavoritesState {
  final String error;

  AddToFavoritesFailure(this.error);
}

final class DeleteFromFavoritesSuccess extends FavoritesState {
  final String message;

  DeleteFromFavoritesSuccess(this.message);
}

final class DeleteFromFavoritesFailure extends FavoritesState{
  final String error;

  DeleteFromFavoritesFailure(this.error);
}
