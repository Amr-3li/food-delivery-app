import 'package:flutter/material.dart';
import 'package:restaurant/features/menu/data/models/customer_profile_model.dart';
import 'package:restaurant/features/menu/data/models/menu_model.dart';

import '../../../../../core/icons.dart';
import 'custom_menu_list.dart';
import 'custom_user_info.dart';

class PersonalInfoViewBody extends StatelessWidget {
  const PersonalInfoViewBody({super.key, this.userModel});

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
      child: Column(
        children: [
          CustomUserInfo(userModel: userModel),
          const SizedBox(height: 28),
          CustomMenuList(
            onItemTap: (item) {},
            menuGroup: MenuGroup(
              items: [
                MenuItem(
                  title: 'Full Name',
                  icon: AppIcons.assetsPersonalInfo,
                  data: userModel?.name ?? '',
                ),
                MenuItem(
                  title: 'Email',
                  icon: AppIcons.assetsEmail,
                  data: userModel?.email ?? '',
                ),
                MenuItem(
                  title: 'Phone Number',
                  icon: AppIcons.assetsPhoneNumber,
                  data: userModel?.phone ?? '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
