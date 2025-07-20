import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:sizer/sizer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.sp),
      child: CachedNetworkImage(
        width: AppResponsive.width(context, value: width),
        height: AppResponsive.height(context, value: height),
        fit: BoxFit.cover,
        imageUrl: imageUrl,

        placeholder: (context, url) => Container(
          width: AppResponsive.width(context, value: width),
          height: AppResponsive.height(context, value: height),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.sp),
            color: Colors.grey[200],
          ),
        ).redacted(
          context: context,
          redact: true,
        ),

        errorWidget: (context, url, error) => Container(
          color: Colors.grey[200],
          child: const Center(
            child: Icon(Icons.fastfood, size: 40, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
