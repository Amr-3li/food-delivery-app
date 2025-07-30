import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/core/utils/assets_data.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/home/data/models/meal_details_model.dart';
import 'package:restaurant/features/home/presentation/views/widgets/size_selector.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/icons.dart';
import '../../cubit/meal_details/meal_details_cubit.dart';
import 'custom_check_out_widget.dart';
import 'custom_ingredients_widget.dart';
import 'custom_network_image.dart';

class FoodDetailsViewBody extends StatelessWidget {
  const FoodDetailsViewBody({super.key});

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
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: ColorsHelper.lightBabyBlue,
                      child: SvgPicture.asset(AppIcons.iIcon),
                    ),
                  ),
                ),
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  background: CustomNetworkImage(
                    topRight: 0,
                    topLeft: 0,
                    imageUrl:
                        mealCubit.mealDetailsModel?.data?.dishImage != null
                        ? mealCubit.mealDetailsModel!.data!.dishImage!
                        : 'https://www.shutterstock.com/image-photo/fried-salmon-steak-cooked-green-600nw-2489026949.jpg',
                    width: double.infinity,
                    height: 300,
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      if (mealCubit.isFavorite) {
                        mealCubit.deleteFromFavorites(dishId: mealCubit.mealDetailsModel!.data!.dishId!);
                      } else {
                        mealCubit.addToFavorites(dishId: mealCubit.mealDetailsModel!.data!.dishId!);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: ColorsHelper.lightBabyBlue,
                        child: mealCubit.isFavorite ? Icon(Icons.favorite, color: Colors.orange) : Icon(Icons.favorite, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            mealCubit.mealDetailsModel!.data!.dishName!,
                            style: Styles.textStyle20,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Image.asset(
                                AssetsData.assetsChefIcon,
                                width: 25,
                                height: 25,
                              ),
                              SizedBox(width: 12),
                              GestureDetector(
                                onTap: () {
                                  GoRouter.of(context).push(AppRouter.kChefDetailsView, extra: mealCubit.mealDetailsModel!.data!.chef);
                                },
                                child: Text(
                                  mealCubit.mealDetailsModel!.data!.chef!.name!,
                                  style: Styles.textStyle16,
                                ),
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorsHelper.orange,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  mealCubit
                                      .mealDetailsModel!
                                      .data!
                                      .category!
                                      .name!,
                                  style: Styles.textStyle14.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.assetsStar,
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                mealCubit.mealDetailsModel!.data!.dishAvgRate!,
                                style: Styles.textStyle16,
                              ),
                              const SizedBox(width: 8),
                              SvgPicture.asset(
                                AppIcons.assetsClock,
                                width: 25,
                                height: 25,
                              ),
                              const SizedBox(width: 6),
                              Text('30-40 min', style: Styles.textStyle16),
                              const SizedBox(width: 8),
                              SvgPicture.asset(
                                AppIcons.assetsCar,
                                width: 22,
                                height: 22,
                              ),
                              const SizedBox(width: 6),
                              Text('Free', style: Styles.textStyle16),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            mealCubit.mealDetailsModel!.data!.dishDescription!,
                            style: Styles.textStyle14,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Size :',
                                style: Styles.textStyle16.copyWith(
                                  color: ColorsHelper.grey,
                                ),
                              ),
                              SizedBox(width: 16),
                              SizeSelector(
                                sizes: mealCubit.mealDetailsModel!.data!.sizes
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text('Ingredients', style: Styles.textStyle16),
                          SizedBox(height: 20),
                          CustomIngredientsWidget(
                            ingredient:
                                mealCubit.mealDetailsModel!.data!.ingredients,
                          ),
                          SizedBox(height: 25),
                        ],
                      ),
                    ),
                    CustomCheckOutWidget(sizeModel: mealCubit.sizeModel ?? mealCubit.mealDetailsModel!.data!.sizes[0]),
                  ],
                ),
              ),
            ],
          );
        }
        return LinearProgressIndicator(color: ColorsHelper.orange);
      },
    );
  }
}
