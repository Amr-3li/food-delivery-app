import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_category_card.dart';

import '../../../../../core/helper/app_router.dart';
import '../../../data/model/popular_fast_food_model.dart';

class CustomPopularGridView extends StatelessWidget {
  const CustomPopularGridView({super.key, required this.popularFastFoodModel});

  final PopularFastFoodModel popularFastFoodModel;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 10),
      crossAxisCount: 2,
      childAspectRatio: .90,
      children: popularFastFoodModel.data
          .map(
            (item) => CustomCategory(
              name: item.dishName ?? '',
              imageUrl: item.dishImage ?? '',
              onTap: () {
                GoRouter.of(context).push(AppRouter.kFoodDetailsView, extra: item.dishId);
              },
            ),
          )
          .toList(),
    );
  }
}
