import 'package:flutter/material.dart';
import 'package:restaurant/features/chief_part/food_details/presentation/widgets/description.dart';
import 'package:restaurant/features/chief_part/food_details/presentation/widgets/food_details_appbar.dart';
import 'package:restaurant/features/chief_part/food_details/presentation/widgets/food_images.dart';
import 'package:restaurant/features/chief_part/food_details/presentation/widgets/food_info.dart';

class FoodDetailsBody extends StatefulWidget {
  const FoodDetailsBody({super.key});

  @override
  State<FoodDetailsBody> createState() => _FoodDetailsBodyState();
}

class _FoodDetailsBodyState extends State<FoodDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FoodDetailsAppbar(title: "Food details"),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [FoodImages(), FoodInfo(), Description()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
