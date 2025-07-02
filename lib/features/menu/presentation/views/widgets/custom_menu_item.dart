import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/icons.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({super.key, required this.name, required this.icon});

  final String name;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: ColorsHelper.white,
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(width: 16),
          Text(
            name,
            style: Styles.textStyle16.copyWith(
              color: ColorsHelper.black,
            ),
          ),
          Spacer(),
          SvgPicture.asset(
            Assets.assetsArrowRight,
          ),
        ],
      ),
    );
  }
}