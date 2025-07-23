import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/app_router.dart';
import '../../../data/models/category_model.dart';
import 'custom_category_card.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key, required this.categories});

  final List<CategoryHomeModel> categories;

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
      itemCount: categories.length,
      itemBuilder: (context, index) => CustomCategory(
        name: categories[index].name,
        imageUrl: categories[index].image,
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.kCategoryDetailsView,
            extra: categories[index].id,
          );
        },
      ),
    );
  }
}