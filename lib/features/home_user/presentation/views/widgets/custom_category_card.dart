import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_network_image.dart';
import 'package:sizer/sizer.dart';

class CustomCategory extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CustomCategory({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: CustomNetworkImage(imageUrl: imageUrl, width: 96, height: 81),
        ),
        SizedBox(height: AppResponsive.height(context, value: 12)),
        Text(
          name,
          style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
