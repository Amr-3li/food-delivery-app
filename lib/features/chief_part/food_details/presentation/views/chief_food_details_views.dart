import 'package:flutter/material.dart';
import 'package:restaurant/features/chief_part/food_details/presentation/widgets/food_details_body.dart';

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({super.key});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FoodDetailsBody());
  }
}
