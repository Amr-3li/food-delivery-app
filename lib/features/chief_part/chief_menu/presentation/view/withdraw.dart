import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:sizer/sizer.dart';
import 'package:svg_flutter/svg_flutter.dart';

class WithdrawView extends StatelessWidget {
  const WithdrawView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8.h),
              SvgPicture.asset(AppIcons.withdrawSuccess, height: 25.h),
              // Lottie.asset(
              //   'assets/images/paymentSucess.json',
              //   height: 25.h,
              //   repeat: false,
              // ),
              SizedBox(height: 2.h),
              Text("Withdraw Successful", style: Styles.textStyle22),
              // SizedBox(
              //   width: 70.w,
              //   child: Center(
              //     child: Text(
              //       "You successfully maked a payment,\n enjoy our service!",
              //       style: Styles.textStyle14,
              //       textAlign: TextAlign.center,
              //     ),
              //   ),
              // ),
              SizedBox(height: 10.h),
              CustomElevatedButton(
                buttonText: "OK",
                buttonColor: ColorsHelper.orange,
                onPressedFunction: () {
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kChifHome); // navigate to another page later
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
