import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/styles.dart';

class FoodType extends StatelessWidget {
  final int currentPage;
  final int totalImages;

  const FoodType({
    super.key,
    required this.currentPage,
    required this.totalImages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 100,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(200),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(child: Text('Breakfast', style: Styles.textStyle16)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalImages, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: currentPage == index ? 12 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: currentPage == index
                    ? Colors.white
                    : Colors.white.withAlpha(150),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
        Container(
          width: 100,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(200),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(child: Text('Delivery', style: Styles.textStyle16)),
        ),
      ],
    );
  }
}
