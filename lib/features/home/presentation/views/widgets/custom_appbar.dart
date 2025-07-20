import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/styles.dart';


class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMenuView);
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: ColorsHelper.orange.withAlpha(100),
            child: Image.asset(AssetsData.defaultUserImage, height: 25, width: 25,),
          ),
        ),
        SizedBox(width: 12,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey Hala,",
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            Text("Good Afternoon,", style: Styles.textStyle16),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kCartView);
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: ColorsHelper.blueBlack,
            child: SvgPicture.asset(AppIcons.assetsCart, color: Colors.white,)
          ),
        ),
      ],
    );
  }
}
