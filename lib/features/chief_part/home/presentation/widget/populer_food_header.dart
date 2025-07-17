import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';

class PopulerFoodHeader extends StatelessWidget {
  const PopulerFoodHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Popular Term This Weeks',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).go(AppRouter.kChifFoodList);
          },
          child: const Text(
            'See All',
            style: TextStyle(
              color: Colors.orange,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
