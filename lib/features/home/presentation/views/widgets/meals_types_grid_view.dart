import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/app_router.dart';
import '../../../data/models/meals_types_model.dart';
import 'custom_category_card.dart';

class MealsTypeGridView extends StatelessWidget {
  const MealsTypeGridView({super.key, required this.mealsTypes});

  final List<MealsTypesModel> mealsTypes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: mealsTypes.length,
      itemBuilder: (context, index) => CustomCategory(
        name: mealsTypes[index].itemName,
        imageUrl: mealsTypes[index].itemImage,
        onTap: () {
          GoRouter.of(context).push(AppRouter.kCategoryDetailsView, extra: mealsTypes[index].itemName);
        },
      ),
    );
  }
}