import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/home/data/repository/meal_details_repository.dart';
import 'package:restaurant/features/home/presentation/cubit/meal_details/meal_details_cubit.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_check_out_widget.dart';
import 'package:restaurant/features/home/presentation/views/widgets/food_details_view_body.dart';
import 'package:restaurant/features/reviews/presentation/cubit/reviews_cubit.dart';

import '../../../../core/utils/app_toast.dart';
import '../../../../core/utils/color_helper.dart';

class FoodDetailsView extends StatefulWidget {
  const FoodDetailsView({super.key, required this.id});

  final int id;

  @override
  State<FoodDetailsView> createState() => _FoodDetailsViewState();
}

class _FoodDetailsViewState extends State<FoodDetailsView> {

  @override
  void initState() {
    super.initState();
    ReviewsCubit.get(context).getDishReviews(dishId: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealDetailsCubit, MealDetailsState>(
      listener: (context, state) {
        if (state is MealAddToFavoritesSuccess) {
          AppToast.showSuccessToast(state.message);
        } else if (state is MealAddToFavoritesFailure) {
          AppToast.showErrorToast(state.error);
        } else if (state is MealDeleteFromFavoritesSuccess) {
          AppToast.showSuccessToast(state.message);
        } else if (state is MealDeleteFromFavoritesFailure) {
          AppToast.showErrorToast(state.error);
        }
      },
      builder: (context, state) {
        final mealCubit = MealDetailsCubit.get(context);
        if (mealCubit.mealDetailsModel != null) {
          return Scaffold(
            body: FoodDetailsViewBody(mealCubit: mealCubit),
            bottomSheet: CustomCheckOutWidget(sizeModel: mealCubit.sizeModel ?? mealCubit.mealDetailsModel!.data!.sizes[0]),
          );
        }
        return const Scaffold(
          body: SafeArea(child: LinearProgressIndicator(color: Colors.orange,)),
        );
      },
    );
  }
}
