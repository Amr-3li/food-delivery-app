import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/back_icon_appbar.dart';
import 'package:sizer/sizer.dart';

class MyProfileColumn extends StatelessWidget {
  const MyProfileColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: Row(
            children: [
              BackIconAppBar(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kChifHome);
                },
              ),
              SizedBox(width: 5.w),
              Text(
                "My profile",
                style: Styles.textStyle18.copyWith(color: ColorsHelper.white),
              ),
            ],
          ),
        ),
        SizedBox(height: 3.h),
        Center(
          child: Text(
            "Available Balance",
            style: Styles.textStyle16.copyWith(color: ColorsHelper.white),
          ),
        ),
        Center(
          child: Text(
            " \$500.00",
            style: Styles.textStyle24.copyWith(color: ColorsHelper.white),
          ),
        ),
        SizedBox(height: 1.h),
        Center(
          child: CustomElevatedButton(
            buttonText: "Withdrow",
            onPressedFunction: () {
              GoRouter.of(context).push(AppRouter.kWithdrawView);
            },
            buttonColor: Colors.transparent,
            sideColor: ColorsHelper.white,
            widthButton: 20.w,
          ),
        ),
      ],
    );
  }
}
