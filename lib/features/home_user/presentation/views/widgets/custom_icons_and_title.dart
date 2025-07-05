import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomIconsTitl extends StatelessWidget {
  const CustomIconsTitl({
    super.key,
    required this.title,
    required this.iconUrl,
  });
  final String title;
  final String iconUrl;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconUrl,
          colorFilter: ColorFilter.mode(ColorsHelper.orange, BlendMode.srcIn),
        ),
        Text(title, style: Styles.textStyle16),
      ],
    );
  }
}
