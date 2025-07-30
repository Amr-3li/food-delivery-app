import 'package:flutter/cupertino.dart';

import 'package:restaurant/core/utils/styles.dart';

import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/utils/color_helper.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({
    super.key,
    this.onTap,
    required this.isSelected,
    required this.name,
  });

  final void Function()? onTap;
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppResponsive.width(context, value: 140),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: isSelected
              ? ColorsHelper.orange
              : ColorsHelper.grey.withAlpha(120),
        ),
        child: Center(
          child: Text(
            name,
            style: Styles.textStyle16.copyWith(
              color: isSelected ? ColorsHelper.white : ColorsHelper.black,
            ),
          ),
        ),
      ),
    );
  }
}
