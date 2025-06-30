import 'package:flutter/material.dart';
import 'package:restaurant/core/icons.dart';
import 'package:svg_flutter/svg.dart';

class BackIconAppBar extends StatelessWidget {
  BackIconAppBar({super.key, required this.onTap});
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(.3),
        child: SvgPicture.asset(Assets.assetsImagesIcon),
      ),
    );
  }
}
