import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/home/data/models/meals_types_details.dart';
import 'package:restaurant/features/home/data/models/meals_types_model.dart';

import '../../../data/models/category_details_model.dart';
import '../../../data/models/category_model.dart';
import '../../../data/repository/category_repository.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);

  List<CategoryHomeModel> categories = [];

  void fetchCategories() async {
    emit(CategoryLoading());
    final result = await categoryRepository.getAllCategories();
    result.fold(
      (failure) => emit(CategoryFailure(failure.errorMessage)),
      (categories) {
        emit(CategorySuccess());
        this.categories = categories;
      },
    );
  }

  List<MealsTypesModel> mealsTypes = [
    MealsTypesModel('breakfast', 'https://potatorolls.com/wp-content/uploads/Lumberjack-Breakfast2.jpg'),
    MealsTypesModel('lunch', 'https://img.hellofresh.com/f_auto,fl_lossy,q_auto,w_1200/hellofresh_s3/image/HF_Y23_M_W27_UK_03_3_low-6510a59e.jpg'),
    MealsTypesModel('dinner', 'https://ichef.bbci.co.uk/food/ic/food_16x9_1600/recipes/roast_chicken_for_one_41998_16x9.jpg'),
  ];

  CategoryDetailsModel? categoryDetails;

  void getCategoryDetails({required int id}) async {
    final result = await categoryRepository.getCategoryDetails(id: id);

    result.fold(
      (failure) => emit(CategoryDetailsFailure(failure)),
      (categoryDetailsModel) {
        emit(CategoryDetailsSuccess());
        categoryDetails = categoryDetailsModel;
      }
    );
  }

  MealsTypeDetialsModel? mealsTypeDetialsModel;

  void getMealsTypeDetails({required String mealType}) async {
    final result = await categoryRepository.getMealsTypeDetails(mealType: mealType);

    result.fold(
            (failure) => emit(MealsTypeDetailsFailure(failure)),
            (mealsTypeDetialsModel) {
          emit(MealsTypeDetailsSuccess());
          this.mealsTypeDetialsModel = mealsTypeDetialsModel;
        }
    );
  }


  void resetDetails() {
    categoryDetails = null;
    mealsTypeDetialsModel = null;
    emit(CategoryInitial());
  }

}
