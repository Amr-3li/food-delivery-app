import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

import 'custom_network_image.dart';

class CustomCategory extends StatelessWidget {
  final String name;
  final String imageUrl;
  final void Function()? onTap;
  const CustomCategory({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: AppResponsive.width(context, value: 122),
            height: AppResponsive.height(context, value: 122),
            alignment: Alignment.center,
            margin: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .2),
                  offset: Offset(0, 4),
                  blurRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.circular(22.sp),
            ),
            child: CustomNetworkImage(
              imageUrl: imageUrl,
              width: 96,
              height: 81,
            ),
          ),
          SizedBox(height: AppResponsive.height(context, value: 12)),
          Text(
            name,
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
