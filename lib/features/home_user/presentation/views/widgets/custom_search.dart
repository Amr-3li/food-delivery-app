import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:sizer/sizer.dart';
import 'package:svg_flutter/svg.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key, this.onTap,
  });
final Function()?onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        margin: EdgeInsets.all(16.sp),
        width: AppResponsive.width(context, value: 327),
        height: AppResponsive.height(context, value: 62),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color:ColorsHelper.whiteGray,
      
      
        ),
        child: Row(
          children: [
            SvgPicture.asset(Assets.assetsImagesSearch),
            Text("   Search dishes, restaurants" , style: Styles.textStyle14.copyWith(fontSize: 15),),
          ],
        ),
      ),
    );
  }
}