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
import 'package:restaurant/features/forget_password/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:restaurant/features/forget_password/forgot_password_cubit/forgot_password_states.dart';
import 'package:restaurant/features/auth/views/widgets/custom_text_form_field.dart';
import 'package:restaurant/features/auth/views/widgets/title_authentication_pages.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/color_helper.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}
class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _key = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<ForgotPasswordCubit, ForgotPasswordStates>(
        listener: (context, state) {
         if (state is ForgotPasswordFailure) {
        setState(() => isLoading = false);
        AppToast.showErrorToast(state.errorMessage);
      } else if (state is ForgotPasswordSendOtpSuccess ) {
        setState(() => isLoading = false);
        AppToast.showSuccessToast("check your email");
        context.go(AppRouter.kSendOtp , extra: emailController.text.trim());
      } else if (state is ForgotPasswordLoading) {
        setState(() => isLoading = true);
      }
        },
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: CircularProgressIndicator(color: Colors.orange, strokeWidth: 2.0, strokeAlign: 3,),
          child: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 8.h,
                  child: TitleAuthenticationPages(
                    title: 'Forgot Password',
                    subTitle: 'Please sign in to your existing account',
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
                        key: _key,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("EMAIL", style: Styles.textStyle14),
                              CustomTextFormField(
                                hintText: "example@gmail.com",
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                lableText: 'Email',
                              ),
          
                              SizedBox(height: 2.5.h),
                              CustomMaterialButton(
                                buttonName: "SEND CODE",
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    BlocProvider.of<ForgotPasswordCubit>(context).sendOtp(email: emailController.text.trim());
                                  }
                                  // context.push("/vertificationView");
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
