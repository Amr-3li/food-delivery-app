import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/app_toast.dart';

import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_arrow_back.dart';
import 'package:restaurant/core/widgets/custom_onboarding_button.dart';
import 'package:restaurant/features/auth/data/models/user_model.dart';
import 'package:restaurant/features/auth/views/cubit/auth_cubit.dart/auth_cubit.dart';
import 'package:restaurant/features/auth/views/cubit/auth_cubit.dart/auth_states.dart';
import 'package:restaurant/features/auth/views/widgets/custom_password_textfiled.dart';
import 'package:restaurant/features/auth/views/widgets/custom_text_form_field.dart';
import 'package:restaurant/features/auth/views/widgets/title_authentication_pages.dart';
import 'package:sizer/sizer.dart';
import 'package:restaurant/core/utils/assets_data.dart';

class SinUpView extends StatefulWidget {
  const SinUpView({super.key});

  @override
  State<SinUpView> createState() => _SinUpViewState();
}

class _SinUpViewState extends State<SinUpView> {
  final _fkey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reTypePassword = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
 bool  isLoading = false;
  @override
  void dispose() {
    passwordController.dispose();
    reTypePassword.dispose();
    emailController.dispose();
    nameController.dispose();
    bioController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
     if (state is AuthError) {
    setState(() => isLoading = false);
    AppToast.showErrorToast(state.message);
  } else if (state is RegisterSuccess) {
    setState(() => isLoading = false);
    AppToast.showSuccessToast("thanks , Go To Verify Your Email");
    context.go(AppRouter.kVerifyEmail , extra:emailController.text.trim() );
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
                Positioned(left: 6.5.w, top: 5.5.h, child: CustomArrowBack()),
                Positioned(
                  top: 7.5.h,
                  left: 18.w,
                  child: TitleAuthenticationPages(
                    title: 'Sign Up',
                    subTitle: 'Please sign up to get started',
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
                        key: _fkey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("NAME", style: Styles.textStyle14),
                              CustomTextFormField(
                                hintText: "John do",
                                keyboardType: TextInputType.name,
                                controller: nameController,
                                lableText: "Name",
                              ),
                              SizedBox(height: 2.h),
                              Text("EMAIL", style: Styles.textStyle14),
                              CustomTextFormField(
                                hintText: "example@gmail.com",
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                lableText: "Email",
                              ),
                               SizedBox(height: 2.h),
                              Text("PHONE", style: Styles.textStyle14),
                              CustomTextFormField(
                                hintText: "0123456785",
                                keyboardType: TextInputType.number,
                                controller: phoneController,
                                lableText: "Phone Number",
                              ),
                              SizedBox(height: 2.h),
                              Text("PASSWORD", style: Styles.textStyle14),
                              PasswordFormField(
                                controller: passwordController,
                                isRetype: false,
                              ),
                              SizedBox(height: 2.h),
                              Text("RE-TYPE PASSWORD", style: Styles.textStyle14),
                              PasswordFormField(
                                controller: reTypePassword,
                                isRetype: true,
                                originalPasswordController: passwordController,
                              ),
                              SizedBox(height: 2.h),
                               Text("Bio", style: Styles.textStyle14),
                              CustomTextFormField(
                                hintText: "I love burger",
                               controller: bioController,
                                lableText: "bio",
                                maxLines: 3,
                              ),
                              SizedBox(height: 5.h),
                              CustomMaterialButton(
                                buttonName: "Sign Up",
                                onPressed: () {
                                  if (_fkey.currentState!.validate()) {
                                    BlocProvider.of<AuthCubit>(context).register(userModel: UserModel( name: nameController.text.trim(),email: emailController.text.trim(), password: passwordController.text ,phone: phoneController.text.trim(), bio: bioController.text));
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
