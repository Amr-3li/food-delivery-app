import 'package:equatable/equatable.dart';
import 'package:restaurant/features/home_user/data/models/category_model.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryModel> categories;

  CategorySuccess(this.categories);

  @override
  List<Object?> get props => [categories];
}

class CategoryFailure extends CategoryState {
  final String error;

  CategoryFailure(this.error);

  @override
  List<Object?> get props => [error];
}
