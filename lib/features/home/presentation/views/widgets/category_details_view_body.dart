import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant/core/utils/color_helper.dart';

import 'package:restaurant/features/home/presentation/views/widgets/custom_category_details_view.dart';

import '../../cubit/category/category_cubit.dart';
import '../../cubit/category/category_state.dart';

import 'custom_meals_types_view.dart';

class CategoryDetailsViewBody extends StatelessWidget {
  const CategoryDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryDetailsSuccess) {
          return CustomCategoryDetailsView(
            categoryDetailsModel: CategoryCubit.get(context).categoryDetails!,
          );
        } else if (state is MealsTypeDetailsSuccess) {
          return CustomMealsTypesView(
            data: CategoryCubit.get(context).mealsTypeDetialsModel!.data,
          );
        }

        return LinearProgressIndicator(color: ColorsHelper.orange);
      },
    );
  }
}
