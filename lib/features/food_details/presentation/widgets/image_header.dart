import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
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
          const Center(
            child: Icon(Icons.image, size: 100, color: Colors.white),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kFavorite);
              },
              icon: Icon(
                Icons.favorite,
                color: version == FoodDetailsVersion.version2
                    ? Colors.orange
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
