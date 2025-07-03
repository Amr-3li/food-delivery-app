import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/circle_icon.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/dropdown_button.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleIcone(
              onTap: () {
                context.push(AppRouter.kReviewView);
              },
              icon: Assets.assetsImagesMenu,
              backgroundColor: ColorsHelper.buttongrey,
            ),
            SizedBox(width: AppResponsive.width(context, value: 10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DELIVERY TO",
                  style: Styles.textStyle12.copyWith(
                    color: ColorsHelper.orange,
                  ),
                ),
                SizedBox(
                  height: AppResponsive.height(context, value: 17),
                  width: AppResponsive.width(context, value: 107),
                  child: CustomDropdownButton(),
                ),
              ],
            ),
          ],
        ),

        CircleIcone(
          onTap: () {
            context.push(AppRouter.kCartView);
          },
          icon: Assets.assetsCart,
          backgroundColor: Colors.black,
          iconColor: Colors.white,
        ),
      ],
    );
  }
}