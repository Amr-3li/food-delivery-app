import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:svg_flutter/svg.dart';

class CircleIcone extends StatelessWidget {
  const CircleIcone({
    super.key,
    required this.icon,
    required this.backgroundColor,
    this.iconColor = const Color.fromARGB(255, 218, 214, 214),
    this.onTap,
  });
  final String icon;
  final Color backgroundColor;
  final Color iconColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: AppResponsive.height(context, value: 22),
        backgroundColor: backgroundColor,
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
