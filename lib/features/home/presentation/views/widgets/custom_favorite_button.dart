import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../cubit/meal_details/meal_details_cubit.dart';

class CustomFavoriteButton extends StatefulWidget {
  const CustomFavoriteButton({super.key});

  @override
  State<CustomFavoriteButton> createState() => _CustomFavoriteButtonState();
}

class _CustomFavoriteButtonState extends State<CustomFavoriteButton> {
  bool? isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = MealDetailsCubit.get(context).mealDetailsModel?.data?.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final mealCubit = MealDetailsCubit.get(context);
    return GestureDetector(
      onTap: () {
        if (isFavorite!) {
          mealCubit.deleteFromFavorites(dishId: mealCubit.mealDetailsModel!.data!.dishId!);
          setState(() {
            isFavorite = false;
          });
        } else {
          mealCubit.addToFavorites(dishId: mealCubit.mealDetailsModel!.data!.dishId!);
          setState(() {
            isFavorite = true;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: CircleAvatar(
          radius: 22,
          backgroundColor: ColorsHelper.lightBabyBlue,
          child: isFavorite ?? false ? Icon(Icons.favorite, color: Colors.orange) : Icon(Icons.favorite, color: Colors.grey),
        ),
      ),
    );
  }
}