import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:svg_flutter/svg.dart';

class CircleIcone extends StatelessWidget {
  const CircleIcone({
    super.key, required this.icon, required this.backgroundColor, this.iconColor,
  });
final String icon;
final Color backgroundColor ;
final Color ?iconColor;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: AppResponsive.height(context, value: 22),
      backgroundColor: backgroundColor,
      child: SvgPicture.asset( 
        icon,
      color: iconColor,
      ),
    );
  }
}