import 'package:flutter/material.dart';
import 'package:restaurant/core/icons.dart';
import 'package:svg_flutter/svg.dart';

class BackIconAppBar extends StatelessWidget {
  const BackIconAppBar({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white.withValues(alpha: .3),
        child: SvgPicture.asset(Assets.assetsImagesIcon),
      ),
    );
  }
}
