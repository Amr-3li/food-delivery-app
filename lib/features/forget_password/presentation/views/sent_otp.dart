import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/utils/assets_data.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_arrow_back.dart';
import 'package:restaurant/core/widgets/custom_onboarding_button.dart';
import 'package:restaurant/features/auth/views/widgets/title_authentication_pages.dart';
import 'package:restaurant/features/forget_password/presentation/views/widgets/pin_text_filed.dart';
import 'package:sizer/sizer.dart';

class SentOtp extends StatefulWidget {
  const SentOtp({super.key, required this.email});
final String email;
  @override
  State<SentOtp> createState() => _SentOtpState();
}

class _SentOtpState extends State<SentOtp> {
   TextEditingController otpController = TextEditingController();
final _vKey = GlobalKey<FormState>();
@override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 10.5.h,
              left: 18.w,
              child: Column(
                children: [
                  TitleAuthenticationPages(
                    title: 'Verification',
                    subTitle: 'We have sent a code to your email',
                  ),
                  Text(
                    widget.email,
                    style: Styles.textStyle16.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: 30.h,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Form(
                    key:_vKey ,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("CODE", style: Styles.textStyle14),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Resend",
                                      style: Styles.textStyle14.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  Text("in.50sec", style: Styles.textStyle14),
                                ],
                              ),
                            ],
                          ),
                          PinTextFiled(pinController: otpController,),

                          SizedBox(height: 2.5.h),
                          CustomMaterialButton(
                            buttonName: "VERTFY",
                            onPressed: () {
                              if(_vKey.currentState!.validate()){
                                context.push(AppRouter.kResetPassword , extra: {"email":widget.email , "otp":otpController.text.trim()});

                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

