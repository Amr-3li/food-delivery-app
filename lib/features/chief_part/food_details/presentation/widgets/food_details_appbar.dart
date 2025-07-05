import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:svg_flutter/svg.dart';

class FoodDetailsAppbar extends StatelessWidget {
  const FoodDetailsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppIcons.iIcon),
          ),
          const SizedBox(width: 8),
          Text(
            'Add New Item',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
          ),
          Spacer(flex: 1),
          TextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kAddNewItem);
            },
            child: Text(
              'edit',
              style: Styles.textStyle16.copyWith(color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }
}
