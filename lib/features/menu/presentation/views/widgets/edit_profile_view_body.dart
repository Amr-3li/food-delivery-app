import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/features/menu/presentation/views/widgets/custom_edit_form_field.dart';

import '../../../../../core/widgets/custom_elevated_button.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 65,
                backgroundColor: ColorsHelper.orange.withAlpha(50),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorsHelper.orange,
                  child: Icon(Icons.edit, color: ColorsHelper.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomEditFormField(
            controller: textController,
            text: 'FULL NAME',
            hintText: 'Vishal Khadok',
          ),
          SizedBox(height: 18),
          CustomEditFormField(
            controller: emailController,
            text: 'Email',
            hintText: 'hello@halallab.co',
          ),
          SizedBox(height: 18),
          CustomEditFormField(
            controller: phoneController,
            text: 'Phone Number',
            hintText: '+91 1234567890',
          ),
          SizedBox(height: 18),
          CustomEditFormField(
            controller: bioController,
            text: 'BIO',
            hintText: 'I love fast food',
          ),
          SizedBox(height: 24),
          SizedBox(
            width: AppResponsive.width(context, value: 350),
            height: AppResponsive.height(context, value: 62),
            child: CustomElevatedButton(
              buttonText: 'Save',
              onPressedFunction: () {},
              buttonColor: ColorsHelper.orange,
            ),
          ),
        ],
      ),
    );
  }
}
