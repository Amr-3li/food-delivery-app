import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chief_part/food_details/presentation/widgets/food_details_body.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';
import 'package:svg_flutter/svg.dart';

class FoodDetailsPage extends StatefulWidget {
  final Meal meal;

  const FoodDetailsPage({super.key, required this.meal});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: SvgPicture.asset(AppIcons.iIcon),
        ),
        title: Text(
          "Food Details",
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: FoodDetailsBody(meal: widget.meal),
    );
  }
}
