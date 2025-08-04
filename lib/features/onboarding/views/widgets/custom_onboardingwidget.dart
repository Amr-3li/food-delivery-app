import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class CustomOnboardingwidget extends StatelessWidget {
  const CustomOnboardingwidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });
  final String imageUrl;
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.sp),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            width: 64.w,
            height: 35.96.h,
          imageUrl: imageUrl,
          placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.orange, strokeWidth: 2.0, strokeAlign: 3,)),
          errorWidget: (context, url, error) => Icon(Icons.error),
               ),
        ),
        SizedBox(height: 5.h),

        Text(
          textAlign: TextAlign.center,
          title,
          style:Styles.textStyle24,
        ),
        SizedBox(height: 15),
        Text(
          textAlign: TextAlign.center,
          description,
          style: Styles.textStyle16.copyWith(
            color: ColorsHelper.grey,)
        ),
      ],
    );
  }
}
