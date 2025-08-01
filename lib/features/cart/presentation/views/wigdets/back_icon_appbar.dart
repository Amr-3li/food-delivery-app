import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/color_helper.dart';

// ignore: must_be_immutable
class BackIconAppBar extends StatelessWidget {
  const BackIconAppBar({
    super.key,
    required this.onTap,
    this.iconColor = Colors.white,
  });
  final void Function()? onTap;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 22,
          backgroundColor: ColorsHelper.lightBabyBlue,
          child: SvgPicture.asset(AppIcons.iIcon),
        ),
      ),
    );
  }
}
