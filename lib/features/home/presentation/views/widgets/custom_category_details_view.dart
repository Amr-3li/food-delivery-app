import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/features/home/data/models/category_details_model.dart';
import 'package:restaurant/features/home/presentation/cubit/category/category_cubit.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/helper/app_router.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/icons.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_category_card.dart';
import 'custom_network_image.dart';

class CustomCategoryDetailsView extends StatelessWidget {
  const CustomCategoryDetailsView({
    super.key,
    required this.categoryDetailsModel,
  });

  final CategoryDetailsModel categoryDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: AppResponsive.height(context, value: 220),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .2),
                    offset: Offset(0, 4),
                    blurRadius: 5,
                  ),
                ],
                borderRadius: BorderRadius.circular(22),
              ),
              child: CustomNetworkImage(
                imageUrl: categoryDetailsModel.data!.category!.image ?? '',
                width: 190,
                height: 110,
              ),
            ),
            Positioned(
              top: 20,
              left: 8,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    CategoryCubit.get(context).mealsTypeDetialsModel = null;
                    CategoryCubit.get(context).categoryDetails = null;
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: ColorsHelper.lightBabyBlue,
                    child: SvgPicture.asset(AppIcons.iIcon),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (categoryDetailsModel.data!.category!.name != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorsHelper.grey.withAlpha(120),
                  ),
                  child: Text(
                    categoryDetailsModel.data!.category!.name!,
                    style: Styles.textStyle16,
                  ),
                ),
              if (categoryDetailsModel.data!.category!.mealType != null)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorsHelper.grey.withAlpha(120),
                  ),
                  child: Text(
                    categoryDetailsModel.data!.category!.mealType!,
                    style: Styles.textStyle16,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 18),
        Expanded(
          child: DishGridView(dishes: categoryDetailsModel.data!.dishes),
        ),
      ],
    );
  }
}

class DishGridView extends StatelessWidget {
  const DishGridView({super.key, required this.dishes});

  final List<Dish> dishes;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 0.85,
      children: dishes
          .map(
            (item) => CustomCategory(
              imageUrl: item.imageUrl,
              name: item.name,
              onTap: () {
                GoRouter.of(
                  context,
                ).push(AppRouter.kFoodDetailsView, extra: item.id);
              },
            ),
          )
          .toList(),
    );
  }
}
