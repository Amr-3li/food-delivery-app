import 'package:flutter/material.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';

class Description extends StatelessWidget {
  final Meal meal;

  const Description({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(meal.description, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
