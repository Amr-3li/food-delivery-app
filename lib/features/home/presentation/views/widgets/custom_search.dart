import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';

import 'package:svg_flutter/svg.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kSearchScreenView);
      },
      child: Container(
        margin: EdgeInsets.only(top: AppResponsive.height(context, value: 16)),
        padding: EdgeInsets.only(left: AppResponsive.width(context, value: 12)),
        width: AppResponsive.width(context, value: 325),
        height: AppResponsive.height(context, value: 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: ColorsHelper.whiteGray,
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.iSearch),
            SizedBox(width: AppResponsive.width(context, value: 10)),
            Text(
              "Search dishes, restaurants",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
