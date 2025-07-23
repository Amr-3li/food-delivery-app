import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_category_details_view.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/utils/icons.dart';
import '../../../data/models/category_details_model.dart';
import '../../../data/models/meals_types_details.dart';
import '../../cubit/category/category_cubit.dart';
import '../../cubit/category/category_state.dart';
import 'custom_category_card.dart';
import 'custom_meals_types_view.dart';
import 'custom_network_image.dart';

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