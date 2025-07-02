import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    super.key,
     this.index,
     this.controller, this.onPressed, required this.buttonName,
  });
  final int ?index;
  final PageController? controller;
final Function()? onPressed;
final String buttonName ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 87.2.w,
      height:7.6.h,
      onPressed:onPressed ,
      color: ColorsHelper.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
      buttonName,
        style: Styles.textStyle17.copyWith(
          color: Colors.white,        ),
      ),
    );
  }
}
