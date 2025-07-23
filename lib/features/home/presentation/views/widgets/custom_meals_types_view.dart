import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/helper/app_router.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/icons.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/meals_types_details.dart';
import 'custom_category_card.dart';

class CustomMealsTypesView extends StatelessWidget {
  const CustomMealsTypesView({super.key, required this.data});

  final List<Datum> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 14),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: ColorsHelper.lightBabyBlue,
                    child: SvgPicture.asset(AppIcons.iIcon),
                  ),
                ),
              ),
              Text(data[0].category!.mealType!, style: Styles.textStyle18)
            ],
          ),
          SizedBox(height: 18),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.85,
              children: data
                  .map(
                    (item) => CustomCategory(
                  imageUrl: item.imageUrl,
                  name: item.name,
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kFoodDetailsScreenView,
                      extra: item.id,
                    );
                  },
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
