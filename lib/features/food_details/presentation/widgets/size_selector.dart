import 'package:flutter/material.dart';
import 'package:restaurant/features/food_details/presentation/views/food_details_screen.dart';

class SizeSelector extends StatelessWidget {
  final FoodDetailsVersion version;

  const SizeSelector({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ["10\"", "14\"", "16\""].map((size) {
        final isSelected = size == "14\"";
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundColor: isSelected ? Colors.orange : Colors.grey[200],
            child: Text(size, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
          ),
        );
      }).toList(),
    );
  }
}
