import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/features/chief_part/chief_menu/presentation/view/widget/myprofile_column.dart';
import 'package:sizer/sizer.dart';

class MyProfileContainer extends StatelessWidget {
  const MyProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      decoration: BoxDecoration(
        color: ColorsHelper.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: MyProfileColumn(),
    );
  }
}
