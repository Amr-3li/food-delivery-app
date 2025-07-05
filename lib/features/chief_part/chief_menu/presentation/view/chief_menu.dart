import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_router.dart';
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
      // backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(clipBehavior: Clip.none, children: [MyProfileContainer()]),
            SizedBox(height: 2.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  ProfileInfoRow(
                    iconColor: ColorsHelper.orangeDark,
                    text: "Chat",
                    imageUrl: AppIcons.iMessage,
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kChatChiefView);
                    },
                  ),
                  SizedBox(height: 3.h),
                  ProfileInfoRow(
                    iconColor: ColorsHelper.orange,
                    imageUrl: AppIcons.assetsWithdrew,
                    text: "Withdrawal History",
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kWithdrawView);
                    },
                  ),

                  ProfileInfoRow(
                    iconColor: ColorsHelper.green,
                    text: "Number of Orders",
                    imageUrl: AppIcons.assetsImagesnoOrder,
                    onPressed: () {},
                    isOrder: true,
                  ),
                  SizedBox(height: 3.h),
                  ProfileInfoRow(
                    iconColor: ColorsHelper.green,
                    text: "User Reviews",
                    imageUrl: AppIcons.assetsReviews,
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kReviewView);
                    }, // Navigate to reviews page,
                  ),
                  SizedBox(height: 3.h),
                  ProfileInfoRow(
                    iconColor: Colors.red,
                    text: "Log Out",
                    imageUrl: AppIcons.assetsImagesLogoutl,
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kOnboardingView);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
