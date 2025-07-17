import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurant/core/assets_data.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_arrow_back.dart';
import 'package:restaurant/core/widgets/custom_onboarding_button.dart';
import 'package:restaurant/features/auth/data/models/user_model.dart';
import 'package:restaurant/features/auth/views/widgets/custom_password_textfiled.dart';
import 'package:restaurant/features/forget_password/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:restaurant/features/forget_password/forgot_password_cubit/forgot_password_states.dart';
import 'package:restaurant/features/auth/views/widgets/title_authentication_pages.dart';
import 'package:sizer/sizer.dart';

class ConfiremPassword extends StatefulWidget {
  const ConfiremPassword({super.key, required this.email, required this.otp});
final String email ;
final String otp;
  @override
  State<ConfiremPassword> createState() => _ConfiremPasswordState();
}
class _ConfiremPasswordState extends State<ConfiremPassword> {
  final _key = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<ForgotPasswordCubit, ForgotPasswordStates>(
        listener: (context, state) {
         if (state is ForgotPasswordFailure) {
        setState(() => isLoading = false);
        AppToast.showErrorToast(state.errorMessage);
      } else if (state is ForgotPasswordSuccess ) {
        setState(() => isLoading = false);
        AppToast.showSuccessToast("Reset Password Successfuly , Go to login page");
        context.go(AppRouter.kLoginView ,);
      } else if (state is ForgotPasswordLoading) {
        setState(() => isLoading = true);
      }
        },
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AssetsData.authBackground,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(left: 6.5.w, top: 5.5.h, child: CustomArrowBack()),
                Positioned(
                  top: 10.5.h,
                  left: 18.w,
                  child: TitleAuthenticationPages(
                    title: 'Forgot Password',
                    subTitle: 'Please Enter New Password',
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
                        key: _key,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Password", style: Styles.textStyle14),
                            PasswordFormField(controller: password, isRetype: false,),
                              SizedBox(height: 2.5.h),
                               Text("Confirem Password", style: Styles.textStyle14),
                            PasswordFormField(controller: confirmPassword, isRetype: true, originalPasswordController: password,),
                            SizedBox(height: 2.5.h),
                              CustomMaterialButton(
                                buttonName: "RESET PASSWORD",
                                onPressed: () {
                                  if (_key.currentState!.validate()) {
                                    BlocProvider.of<ForgotPasswordCubit>(context).resetPassword(userModel: UserModel(email: widget.email, password: password.text , passwordConfirmation: confirmPassword.text ,otp: widget.otp));
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
