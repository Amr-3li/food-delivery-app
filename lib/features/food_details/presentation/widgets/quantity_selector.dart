import 'package:flutter/material.dart';
import 'package:restaurant/features/food_details/presentation/views/food_details_screen.dart';

class QuantitySelector extends StatelessWidget {
  final FoodDetailsVersion version;

  const QuantitySelector({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingActionButton.small(
          heroTag: version == FoodDetailsVersion.version1 ? 'minus1' : 'minus2',
          onPressed: () {},
          backgroundColor: Colors.deepPurple[100],
          elevation: 0,
          child: const Icon(Icons.remove, color: Colors.black),
        ),
        const SizedBox(width: 12),
        const Text(
          "2",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 12),
        FloatingActionButton.small(
          heroTag: version == FoodDetailsVersion.version1 ? 'plus1' : 'plus2',
          onPressed: () {},
          backgroundColor: Colors.deepPurple[100],
          elevation: 0,
          child: const Icon(Icons.add, color: Colors.black),
        ),
      ],
    );
  }
}

