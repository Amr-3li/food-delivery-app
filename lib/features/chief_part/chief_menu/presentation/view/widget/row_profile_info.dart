import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:sizer/sizer.dart';
import 'package:svg_flutter/svg.dart';

class ProfileInfoRow extends StatelessWidget {
  const ProfileInfoRow({
    super.key,
    required this.iconColor,
    required this.text,
    required this.onPressed,
    required this.imageUrl,
  });

  final Color iconColor;
  final String text;
  final void Function()? onPressed;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Row(
        children: [
          SvgPicture.asset(imageUrl, height: 8.w, width: 8.w, color: iconColor),
          SizedBox(width: 2.w),
          Text(text, style: Styles.textStyle16),
          Spacer(),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_rounded),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
