import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/assets_data.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_arrow_back.dart';
import 'package:restaurant/core/widgets/custom_onboarding_button.dart';
import 'package:restaurant/features/auth/views/widgets/custom_text_form_field.dart';
import 'package:restaurant/features/auth/views/widgets/title_authentication_pages.dart';
import 'package:sizer/sizer.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}
final key = GlobalKey<FormState>();
class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(AssetsData.authBackground, 
                fit: BoxFit.cover,
                         
              ),
            ),
          Positioned(
            left: 6.5.w,
            top: 5.5.h,
            child: CustomArrowBack(),
          ),
           Positioned(
            top: 10.5.h,
            left: 18.w,
             child: TitleAuthenticationPages(title: 'Forgot Password', subTitle: 'Please sign in to your existing account',),
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
                  key: key,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("EMAIL" , style: Styles.textStyle14,),
                        CustomTextFormField(hintText: "example@gmail.com", keyboardType: TextInputType.emailAddress, lableText: 'Email',
                        ),
                     
                           SizedBox(height: 2.5.h,),
                            CustomMaterialButton( buttonName: "SEND CODE",
                              onPressed: () {
                                if (key.currentState!.validate()){

                                }
                                 context.push("/vertificationView");
                               
                              }),
                             
                      ],
                    ),
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}



