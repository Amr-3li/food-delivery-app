import 'package:flutter/material.dart';
import 'package:restaurant/features/food_details/presentation/views/food_details_screen.dart';

class IngredientIcons extends StatelessWidget {
  final FoodDetailsVersion version;

  const IngredientIcons({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundColor: version == FoodDetailsVersion.version2 ? Colors.orange[50] : Colors.grey[100],
            child: const Icon(Icons.restaurant_menu, size: 20),
          ),
        );
      }),
    );
  }
}
