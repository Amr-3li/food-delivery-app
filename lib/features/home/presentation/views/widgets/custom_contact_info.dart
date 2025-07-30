import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/styles.dart';

class CustomContactInfo extends StatelessWidget {
  const CustomContactInfo({super.key, required this.text, required this.image, this.onTap});

  final String text;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withAlpha(40),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            SizedBox(width: 20),
            SvgPicture.asset(image, height: 20, width: 20),
            SizedBox(width: 16),
            Text(text, style: Styles.textStyle14),
          ],
        ),
      ),
    );
  }
}