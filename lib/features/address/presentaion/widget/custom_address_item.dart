import 'package:flutter/material.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomAddressItem extends StatelessWidget {
  const CustomAddressItem({
    super.key,
    required this.address,
    required this.icon,
    required this.title,
  });

  final String address;
  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsHelper.grey.withAlpha(80),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: ColorsHelper.white,
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(title, style: Styles.textStyle16),
                    Spacer(),
                    SvgPicture.asset(AppIcons.assetsEdit),
                    SizedBox(width: 8),
                    SvgPicture.asset(AppIcons.assetsDelete),
                  ],
                ),
                const SizedBox(height: 8),
                Text(address, overflow: TextOverflow.ellipsis, maxLines: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
