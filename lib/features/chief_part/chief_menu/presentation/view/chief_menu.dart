import 'package:flutter/material.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:go_router/go_router.dart';

import 'package:restaurant/features/chief_part/chief_menu/presentation/view/widget/myprofile_container.dart';
import 'package:restaurant/features/chief_part/chief_menu/presentation/view/widget/row_profile_info.dart';
import 'package:sizer/sizer.dart';

class ChiefMenuScreen extends StatelessWidget {
  const ChiefMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(clipBehavior: Clip.none, children: [MyProfileContainer()]),
            SizedBox(height: 2.h),
            ProfileInfoRow(
              iconColor: ColorsHelper.orange,
              imageUrl: Assets.assetsPersonalInfo,
              text: "Personal Info",
              onPressed: () {},
            ),
            ProfileInfoRow(
              iconColor: const Color.fromRGBO(65, 25, 102, 1),
              imageUrl: Assets.assetsSettings,
              text: "Settings",
              onPressed: () {},
            ),
            SizedBox(height: 1.h),
            ProfileInfoRow(
              iconColor: ColorsHelper.orangeDark,
              text: "Chat",
              imageUrl: Assets.assetsImagesMessage,
              onPressed: () {
                context.go("/messageList");
              },
            ),
            ProfileInfoRow(
              iconColor: ColorsHelper.green,
              text: "Number of Orders",
              imageUrl: Assets.assetsImagesnoOrder,
              onPressed: () {},
            ),
            SizedBox(height: 1.h),
            ProfileInfoRow(
              iconColor: ColorsHelper.green,
              text: "User Reviews",
              imageUrl: Assets.assetsReviews,
              onPressed: () {
                context.go("/reviews");
              }, // Navigate to reviews page,
            ),
            SizedBox(height: 2.h),
            ProfileInfoRow(
              iconColor: Colors.red,
              text: "Log Out",
              imageUrl: Assets.assetsImagesLogoutl,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
