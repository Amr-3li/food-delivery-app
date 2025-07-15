import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/home_user/data/repository/category_repository.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  void fetchCategories() async {
    emit(CategoryLoading());
    final result = await categoryRepository.getAllCategories();
    result.fold(
      (failure) => emit(CategoryFailure(failure.errorMessage)),
      (categories) => emit(CategorySuccess(categories)),
    );
  }
}
