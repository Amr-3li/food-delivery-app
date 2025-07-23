import 'package:equatable/equatable.dart';

import '../../../data/models/category_details_model.dart';
import '../../../data/models/category_model.dart';

abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {}

class CategoryFailure extends CategoryState {
  final String error;

  CategoryFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class CategoryDetailsSuccess extends CategoryState {}

class CategoryDetailsFailure extends CategoryState {
  final String error;

  CategoryDetailsFailure(this.error);
}

class MealsTypeDetailsSuccess extends CategoryState {}

class MealsTypeDetailsFailure extends CategoryState {
  final String error;

  MealsTypeDetailsFailure(this.error);
}