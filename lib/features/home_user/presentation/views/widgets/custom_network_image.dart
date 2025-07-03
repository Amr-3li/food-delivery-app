import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart' ;
import 'package:sizer/sizer.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key, required this.imageUrl, required this.width, required this.height,
  });
final String imageUrl;
final double width;
final double height;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20.sp),
      child: CachedNetworkImage(
        width: AppResponsive.width(context, value:width),
        height: AppResponsive.height(context, value: height),
        fit: BoxFit.fill,
         placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
        
        imageUrl: imageUrl),
    );
  }
}
