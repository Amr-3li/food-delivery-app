import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/assets_data.dart';

class SucessPayment extends StatelessWidget {
  const SucessPayment({super.key});

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
              SizedBox(height: 20.h),
              SvgPicture.asset(
                AssetsData.assetsPaymentSuccess,
              ),
              SizedBox(height: 5.h),
              Text("Congratulations!", style: Styles.textStyle24),
              SizedBox(
                width: 70.w,
                child: Center(
                  child: Text(
                    "You successfully maked a payment,\n enjoy our service!",
                    style: Styles.textStyle14,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              CustomElevatedButton(
                buttonText: "Continue Shopping",
                buttonColor: ColorsHelper.orange,
                onPressedFunction: () {
                  GoRouter.of(context).go(
                    AppRouter.kHomeUserView,
                  ); // navigate to another page later
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
