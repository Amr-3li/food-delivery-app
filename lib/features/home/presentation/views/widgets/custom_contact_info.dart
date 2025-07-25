import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomContactInfo extends StatelessWidget {
  const CustomContactInfo({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(40),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          SizedBox(width: 20),
          Image.asset(image, height: 40, width: 40),
          SizedBox(width: 16),
          Text(text, style: Styles.textStyle14),
        ],
      ),
    );
  }
}