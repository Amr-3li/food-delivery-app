import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurant/core/utils/assets_data.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_onboarding_button.dart';
import 'package:restaurant/features/auth/views/cubit/auth_cubit.dart/auth_cubit.dart';
import 'package:restaurant/features/auth/views/cubit/auth_cubit.dart/auth_states.dart';
import 'package:restaurant/features/auth/views/widgets/custom_password_textfiled.dart';
import 'package:restaurant/features/auth/views/widgets/custom_text_button.dart';
import 'package:restaurant/features/auth/views/widgets/custom_text_form_field.dart';
import 'package:restaurant/features/auth/views/widgets/title_authentication_pages.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          setState(() => isLoading = false);
          AppToast.showErrorToast(state.message);
        } else if (state is LoginSuccess) {
          setState(() => isLoading = false);
          AppToast.showSuccessToast("Login Successfully");
          if (state.userData.data!.user!.type == "chef") {
            context.go(AppRouter.kChifHome, extra: state.userData);
          }
          context.go(AppRouter.kHomeUserView);
        } else if (state is AuthLoading) {
          setState(() => isLoading = true);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ModalProgressHUD(
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
                Positioned(
                  top: 7.5.h,
                  left: 18.w,
                  child: TitleAuthenticationPages(
                    title: 'Log In',
                    subTitle: 'Please sign in to your existing account',
                  ),
                ),
                Positioned.fill(
                  top: 28.7.h,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("EMAIL", style: Styles.textStyle14),
                              CustomTextFormField(
                                hintText: "example@gmail.com",
                                keyboardType: TextInputType.emailAddress,
                                lableText: "Email",
                                controller: emailController,
                              ),
                              SizedBox(height: 2.h),
                              Text("PASSWORD", style: Styles.textStyle14),
                              PasswordFormField(
                                controller: passwordController,
                                isRetype: false,
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: false,
                                        onChanged: (v) {},
                                        activeColor: ColorsHelper.orange,
                                        focusColor: ColorsHelper.buttongrey,
                                      ),
                                      Text(
                                        "Remember me",
                                        style: Styles.textStyle13.copyWith(
                                          color: ColorsHelper.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CustomTextButton(
                                    buttonName: 'Forgot Password?',
                                    onPressed: () =>
                                        context.push("/forgetPassword"),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              CustomMaterialButton(
                                buttonName: "Login",
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<AuthCubit>(context).login(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 2.h),
                              // CustomMaterialButton(
                              //   buttonName: "Login Chif",
                              //   onPressed: () {
                              //     if (_formKey.currentState!.validate()) {
                              //       GoRouter.of(context).go(AppRouter.kChifHome);
                              //     }
                              //   },
                              // ),
                              // SizedBox(height: 3.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: Styles.textStyle16.copyWith(
                                      color: ColorsHelper.grey,
                                    ),
                                  ),
                                  CustomTextButton(
                                    buttonName: 'SIGN UP',
                                    onPressed: () => context.push("/signUp"),
                                  ),
                                ],
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
