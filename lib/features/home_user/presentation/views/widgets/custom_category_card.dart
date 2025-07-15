import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_network_image.dart';
import 'package:sizer/sizer.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({super.key});

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
                color: Colors.black.withValues(alpha: 0.2),
                offset: Offset(0, 4),
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(22.sp),
          ),
          child: CustomNetworkImage(
            imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfL0Ahbgn1CWY-UjxICwSCX6QA9XPCLiLmfi3K1SPm15LLC8C056QRuYakxRlbx-jMWj8&usqp=CAU",
            width: 96,
            height: 81,
          ),
        ),
        SizedBox(height: AppResponsive.height(context, value: 12)),
        Text(
          "Pizaa",
          style: Styles.textStyle17.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
