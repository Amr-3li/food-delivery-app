import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import '../../../data/models/menu_group_list.dart';
import 'custom_menu_list.dart';
import 'custom_user_info.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomUserInfo(),
            const SizedBox(height: 28),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CustomMenuList(
                menuGroup: menuGroups[index],
                onTap: () {
                  context.push(
                    menuGroups[index].items[index].route ??
                        AppRouter.kAddresses,
                  );
                },
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: menuGroups.length,
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
