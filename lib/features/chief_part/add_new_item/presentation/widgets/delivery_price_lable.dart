import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class PriceLabel extends StatelessWidget {
  const PriceLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Text(
        'PRICE',
        style: Styles.textStyle16.copyWith(
          color: ColorsHelper.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
