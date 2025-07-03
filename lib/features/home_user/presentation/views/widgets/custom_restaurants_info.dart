import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_icons_and_title.dart'
    show CustomIconsTitl;
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_network_image.dart';

class CustomRestorantInfo extends StatelessWidget {
  const CustomRestorantInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomNetworkImage(
          imageUrl:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfL0Ahbgn1CWY-UjxICwSCX6QA9XPCLiLmfi3K1SPm15LLC8C056QRuYakxRlbx-jMWj8&usqp=CAU",
          width: 327,
          height: 140,
        ),
        Text("rose garden restaurant", style: Styles.textStyle20),
        Text(
          "Burger - Chiken - Riche - Wings",
          style: Styles.textStyle14.copyWith(color: ColorsHelper.grayWords),
        ),
        SizedBox(height: AppResponsive.height(context, value: 10)),
        Row(
          children: [
            CustomIconsTitl(title: ' 4:7', iconUrl: AppIcons.iStar),
            SizedBox(width: AppResponsive.width(context, value: 12)),
            CustomIconsTitl(title: ' Free', iconUrl: AppIcons.iCar),
            SizedBox(width: AppResponsive.width(context, value: 12)),
            CustomIconsTitl(title: ' 20 min', iconUrl: AppIcons.iWatch),
          ],
        ),
      ],
    );
  }
}
