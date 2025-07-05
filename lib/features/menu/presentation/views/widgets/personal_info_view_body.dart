import 'package:flutter/material.dart';
import 'package:restaurant/features/menu/data/models/menu_model.dart';

import '../../../../../core/icons.dart';
import 'custom_menu_list.dart';
import 'custom_user_info.dart';

class PersonalInfoViewBody extends StatelessWidget {
  const PersonalInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
      child: Column(
        children: [
          CustomUserInfo(),
          const SizedBox(height: 28),
          CustomMenuList(
            onTap: () {},
            menuGroup: MenuGroup(
              items: [
                MenuItem(
                  title: 'Full Name',
                  icon: AppIcons.assetsPersonalInfo,
                  data: 'Vishal Khadok',
                ),
                MenuItem(
                  title: 'Email',
                  icon: AppIcons.assetsEmail,
                  data: 'hello@halallab.co',
                ),
                MenuItem(
                  title: 'Phone Number',
                  icon: AppIcons.assetsPhoneNumber,
                  data: '+91 1234567890',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
