import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/icons.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomMenuItem extends StatelessWidget {
  const CustomMenuItem({
    super.key,
    required this.name,
    required this.icon,
    this.data,
    required this.onTap,
  });

  final String name;
  final String icon;
  final String? data;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: ColorsHelper.white,
              child: SvgPicture.asset(icon, height: 18, width: 18,),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Styles.textStyle16.copyWith(
                      color: ColorsHelper.black,
                    ),
                  ),
                  if (data != null)
                    Text(
                      data!,
                      style: Styles.textStyle16.copyWith(
                        color: ColorsHelper.grey,
                      ),
                    ),
                ],
              ),
            ),
            if (onTap != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SvgPicture.asset(AppIcons.assetsArrowRight),
              ),
          ],
        ),
      ),
    );
  }
}
