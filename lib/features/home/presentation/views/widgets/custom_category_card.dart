import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

import 'custom_network_image.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({
    super.key,
    this.name,
    this.imageUrl,
    this.onTap,
    this.size,
    this.price,
  });

  final String? name;
  final String? imageUrl;
  final String? size;
  final String? price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: AppResponsive.width(context, value: 130),
            height: AppResponsive.height(context, value: 130),
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
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
              imageUrl: imageUrl ?? '',
              width: 90,
              height: 90,
            ),
          ),
          SizedBox(height: AppResponsive.height(context, value: 10)),
          if (size != null && price != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  size!,
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 40),
                Text(
                  '\$ $price',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          SizedBox(height: AppResponsive.height(context, value: 10)),
          Text(
            name ?? '',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
