import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/features/menu/presentation/manger/menu/menu_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/features/menu/presentation/views/widgets/custom_edit_form_field.dart';

import '../../../../../core/assets_data.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/image_picker/image_picker_view.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key});

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  XFile? image;
  final TextEditingController textController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {
        if (state is EditCustomerProfileSuccess) {
          AppToast.showSuccessToast(state.successMessage);
        } else if (state is EditCustomerProfileError) {
          AppToast.showErrorToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        final userModel = MenuCubit.get(context).userModel;
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ImageManagerView(
                    onPicked: (image) {
                      this.image = image;
                    },
                    pickedBody: (image) {
                      return CircleAvatar(
                        radius: 65,
                        backgroundImage: FileImage(File(image.path)),
                      );
                    },
                    unPickedBody: CircleAvatar(
                      radius: 65,
                      backgroundColor: ColorsHelper.orange.withAlpha(50),
                      child: Image.asset(
                        userModel?.profileImage ?? AssetsData.defaultUserImage,
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                hintText: userModel?.name ?? '',
              ),
              SizedBox(height: 18),
              CustomEditFormField(
                controller: emailController,
                text: 'Email',
                hintText: userModel?.email ?? '',
              ),
              SizedBox(height: 18),
              CustomEditFormField(
                controller: phoneController,
                text: 'Phone Number',
                hintText: userModel?.phone ?? '',
              ),
              SizedBox(height: 18),
              CustomEditFormField(
                controller: bioController,
                text: 'BIO',
                hintText: userModel?.bio ?? '',
              ),
              SizedBox(height: 24),
              SizedBox(
                width: AppResponsive.width(context, value: 350),
                height: AppResponsive.height(context, value: 62),
                child: CustomElevatedButton(
                  buttonText: 'Save',
                  onPressedFunction: () {
                    if (checkDataNotNull()) {
                      debugPrint('profile image: ${image?.path}');
                      debugPrint('name: ${textController.text}');
                      debugPrint('email: ${emailController.text}');
                      debugPrint('phone: ${phoneController.text}');
                      debugPrint('bio: ${bioController.text}');
                      MenuCubit.get(context).editCustomerProfile(
                        profileImage: image,
                        name: textController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        bio: bioController.text,
                      );
                    }
                  },
                  buttonColor: checkDataNotNull()
                      ? ColorsHelper.orange
                      : ColorsHelper.orangeGrey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool checkDataNotNull() {
    return textController.text.isNotEmpty ||
        emailController.text.isNotEmpty ||
        phoneController.text.isNotEmpty ||
        bioController.text.isNotEmpty ||
        image != null;
  }
}
