import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';

class FoodInfo extends StatelessWidget {
  final Meal meal;

  const FoodInfo({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(meal.name, style: Styles.textStyle20),
              Text(
                '\$${meal.sizes.isNotEmpty ? meal.sizes[0].price : 'N/A'}',
                style: Styles.textStyle20,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                meal.category.name,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${meal.rating.formattedAverage} (${meal.rating.totalReviews} Reviews)',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
