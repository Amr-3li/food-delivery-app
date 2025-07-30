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
    this.topRight = 20,
    this.topLeft = 20,
    this.bottomLeft = 20,
    this.bottomRight = 20,
  });

  final String imageUrl;
  final double width;
  final double height;
  final double topRight;
  final double topLeft;
  final double bottomLeft;
  final double bottomRight;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(topRight),
        topLeft: Radius.circular(topLeft),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
      child: CachedNetworkImage(
        width: AppResponsive.width(context, value: width),
        height: AppResponsive.height(context, value: height),
        fit: BoxFit.cover,
        imageUrl: imageUrl,

        placeholder: (context, url) => Container(
          width: AppResponsive.width(context, value: width),
          height: AppResponsive.height(context, value: height),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(topRight),
              topLeft: Radius.circular(topLeft),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight),
            ),
            color: Colors.grey[200],
          ),
        ).redacted(context: context, redact: true),

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
