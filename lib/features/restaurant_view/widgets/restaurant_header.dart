import 'package:flutter/material.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/restaurant_view_screen.dart';

class RestaurantHeader extends StatelessWidget {
  final RestaurantViewVersion version;

  const RestaurantHeader({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: version == RestaurantViewVersion.version1 ? 180 : 200,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(version == RestaurantViewVersion.version1 ? 16 : 0),
          ),
          width: double.infinity,
        ),
        const Positioned(
          top: 12,
          left: 12,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        const Positioned(
          top: 12,
          right: 12,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.more_horiz, color: Colors.black),
          ),
        ),
        if (version == RestaurantViewVersion.version2)
          const Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 8, color: Colors.grey),
                SizedBox(width: 4),
                Icon(Icons.circle, size: 8, color: Colors.orange),
                SizedBox(width: 4),
                Icon(Icons.circle, size: 8, color: Colors.grey),
              ],
            ),
          )
      ],
    );
  }
}