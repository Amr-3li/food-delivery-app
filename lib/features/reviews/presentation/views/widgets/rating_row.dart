import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating; // from 0 to 5

  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < rating ? Colors.amber : Colors.grey[400],
          size: 24,
        );
      }),
    );
  }
}
