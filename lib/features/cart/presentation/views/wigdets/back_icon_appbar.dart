import 'package:flutter/material.dart';
import 'package:restaurant/core/icons.dart';
import 'package:svg_flutter/svg.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white.withValues(alpha: .3),
        child: SvgPicture.asset(AppIcons.iIcon),
      ),
    );
  }
}
