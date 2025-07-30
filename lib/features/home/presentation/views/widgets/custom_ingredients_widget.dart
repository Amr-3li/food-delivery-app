import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/meal_details_model.dart';

class CustomIngredientsWidget extends StatelessWidget {
  const CustomIngredientsWidget({super.key, required this.ingredient});

  final List<Ingredient> ingredient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.height(context, value: 35),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              color: ColorsHelper.orange.withAlpha(200),
              borderRadius: BorderRadius.circular(20)
          ),
          padding: const EdgeInsets.all(8),
          child: Text(ingredient[index].name ?? '', style: Styles.textStyle16.copyWith(color: Colors.white),),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemCount: ingredient.length,
      ),
    );
  }
}
