import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant/features/home/data/models/meal_details_model.dart';
import 'package:restaurant/features/home/data/repository/meal_details_repository.dart';

part 'meal_details_state.dart';

class MealDetailsCubit extends Cubit<MealDetailsState> {
  MealDetailsCubit(this.mealDetailsRepository) : super(MealDetailsInitial());

  final MealDetailsRepository mealDetailsRepository;

  static MealDetailsCubit get(context) => BlocProvider.of(context);

  MealDetailsModel? mealDetailsModel;

  void getMealDetails({required int id}) {
    mealDetailsRepository.getMealDetails(id: id).then((result) {
      result.fold(
            (failure) {
          emit(MealDetailsFailure(failure));
        },
            (mealDetailsModel) {
          emit(MealDetailsSuccess());
          this.mealDetailsModel = mealDetailsModel;
        },
      );
    },);
  }

  SizeModel? sizeModel;

  void changeSize({SizeModel? sizeModel}) {
    if (sizeModel != null) {
      this.sizeModel = sizeModel;
    }
    emit(MealDetailsChangeSize());
  }

  bool isFavorite = false;

  void addToFavorites({required int dishId}) {
    mealDetailsRepository.addToFavorites(dishId: dishId).then((result) {
      result.fold(
            (failure) {
          emit(MealAddToFavoritesFailure(failure));
        },
            (message) {
          emit(MealAddToFavoritesSuccess(message));
          isFavorite = true;
        },
      );
    });
  }

  void deleteFromFavorites({required int dishId}) {
    mealDetailsRepository.deleteFromFavorites(dishId: dishId).then((result) {
      result.fold(
            (failure) {
          emit(MealDeleteFromFavoritesFailure(failure));
        },
            (message) {
          emit(MealDeleteFromFavoritesSuccess(message));
          isFavorite = false;
        },
      );
    });
  }
}
