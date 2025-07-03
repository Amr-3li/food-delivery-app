import 'package:flutter/material.dart';
import 'package:restaurant/features/food_details/presentation/views/food_details_screen.dart';

class ImageHeader extends StatelessWidget {
  final FoodDetailsVersion version;

  const ImageHeader({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey[300],
      child: Stack(
        children: [
          const Center(child: Icon(Icons.image, size: 100, color: Colors.white)),
          Positioned(
            top: 16,
            left: 16,
            child: const Icon(Icons.arrow_back),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Icon(
              Icons.favorite,
              color: version == FoodDetailsVersion.version2 ? Colors.orange : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

