import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurant/core/utils/assets_data.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_arrow_back.dart';
import 'package:restaurant/core/widgets/custom_onboarding_button.dart';
import 'package:restaurant/features/auth/views/cubit/auth_cubit.dart/auth_cubit.dart';
import 'package:restaurant/features/auth/views/cubit/auth_cubit.dart/auth_states.dart';
import 'package:restaurant/features/auth/views/widgets/title_authentication_pages.dart';
import 'package:restaurant/features/forget_password/presentation/views/widgets/pin_text_filed.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/color_helper.dart';

class VertificationView extends StatefulWidget {
  const VertificationView({super.key, required this.email});
  final String email;
  @override
  State<VertificationView> createState() => _VertificationViewState();
}
bool isLoading =false;
class _VertificationViewState extends State<VertificationView> {
  TextEditingController pinController = TextEditingController();
  final _vKey = GlobalKey<FormState>();
  @override
  void dispose() {
 pinController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
             if (state is AuthError) {
    setState(() => isLoading = false);
    AppToast.showErrorToast(state.message);
  } else if (state is VerifyEmailSuccess) {
    setState(() => isLoading = false);
    AppToast.showSuccessToast("thanks , Go to Login Page");
    GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
  } else if (state is AuthLoading) {
    setState(() => isLoading = true);
  }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: CircularProgressIndicator(color: Colors.orange, strokeWidth: 2.0, strokeAlign: 3,),
          child: SafeArea(
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
                  top: 28.7.h,
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
                        key: _vKey,
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
                              PinTextFiled(pinController: pinController),
          
                              SizedBox(height: 2.5.h),

                              CustomMaterialButton(
                                buttonName: "VERTFY",
                                onPressed: () {
                                  if (_vKey.currentState!.validate()) {
                                    BlocProvider.of<AuthCubit>(
                                      context,
                                    ).verifyEmail(
                                      email: widget.email,
                                      otp: pinController.text.trim(),
                                    );
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
        ),
      ),
    );
  }
}
