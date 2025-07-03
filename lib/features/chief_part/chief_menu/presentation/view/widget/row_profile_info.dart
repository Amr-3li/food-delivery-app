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
    this.isOrder = false,
  });

  final Color iconColor;
  final String text;
  final void Function()? onPressed;
  final String imageUrl;
  final bool isOrder;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),

      // margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      child: ListTile(
        leading: CircleAvatar(
          child: SvgPicture.asset(
            imageUrl,
            height: 8.w,
            width: 8.w,
            color: iconColor,
          ),
        ),
        title: Text(text, style: Styles.textStyle16),
        trailing: isOrder
            ? Text("29K", style: Styles.textStyle18)
            : IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: onPressed,
              ),
      ),
    );
  }
}
