import 'package:flutter/material.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomAddAddressFiled extends StatelessWidget {
  const CustomAddAddressFiled({
    super.key,
    required this.title,
    required this.width,
    required this.height,
    this.icon,
    required this.text,
  });

  final String title;
  final String text;
  final double width;
  final double height;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Styles.textStyle16),
        SizedBox(height: 10),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(80),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                if (icon != null)
                  Icon(icon, color: ColorsHelper.black.withAlpha(80)),
                if (icon != null) SizedBox(width: 10),
                Expanded(
                  child: Text(
                    text,
                    style: Styles.textStyle16.copyWith(
                      color: ColorsHelper.black.withAlpha(80),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}