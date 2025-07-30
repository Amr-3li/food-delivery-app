import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant/features/favorits/data/models/favorites_model.dart';
import 'package:restaurant/features/favorits/data/repo/favorites_repo.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.favoritesRepo) : super(FavoritesInitial());
  final FavoritesRepo favoritesRepo;

  static FavoritesCubit get(context) => BlocProvider.of(context);

  FavoritesModel? favoritesModel;

  void getFavorites() {
    favoritesRepo.getFavorites().then((result) {
      result.fold(
        (failure) {
          emit(GetFavoritesError(failure));
        },
        (favoritesModel) {
          emit(GetFavoritesSuccess());
          this.favoritesModel = favoritesModel;
        },
      );
    });
  }

  bool isFavorite = true;

  void addToFavorites({required int dishId}) {
    favoritesRepo.addToFavorites(dishId).then((result) {
      result.fold(
        (failure) {
          emit(AddToFavoritesFailure(failure));
        },
        (message) {
          emit(AddToFavoritesSuccess(message));
          isFavorite = true;
          getFavorites();
        },
      );
    });
  }

  void deleteFromFavorites({required int dishId}) {
    favoritesRepo.deleteFromFavorites(dishId).then((result) {
      result.fold(
        (failure) {
          emit(DeleteFromFavoritesFailure(failure));
        },
        (message) {
          emit(DeleteFromFavoritesSuccess(message));
          isFavorite = false;
          getFavorites();
        },
      );
    });
  }
}
