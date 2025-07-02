import 'package:flutter/material.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomUserInfo extends StatelessWidget {
  const CustomUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 50, backgroundColor: ColorsHelper.grey),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vishal Khadok', style: Styles.textStyle20),
            const SizedBox(height: 4),
            Text(
              'I love fast food',
              style: Styles.textStyle14.copyWith(
                color: ColorsHelper.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}