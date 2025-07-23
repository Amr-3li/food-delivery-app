import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/helper/app_router.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/icons.dart';
import '../../../../../core/utils/styles.dart';

import '../../../data/models/restaurant_model.dart';
import 'custom_icons_and_title.dart';
import 'custom_network_image.dart';

class CustomRestorantInfo extends StatelessWidget {
  final RestaurantModel? restaurant;

  const CustomRestorantInfo({super.key,  this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.krestaurantView, extra: restaurant?.id ?? 0);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            imageUrl:
                "https://popmenucloud.com/cdn-cgi/image/width%3D1200%2Cheight%3D1200%2Cfit%3Dscale-down%2Cformat%3Dauto%2Cquality%3D60/evuzicja/678850d5-0715-407f-92dd-499326242d71.jpg",
            width: double.infinity,
            height: 140,
          ),
          Text(restaurant?.name ?? '', style: Styles.textStyle20),
          Text(
            restaurant?.description ?? '',
            style: Styles.textStyle14.copyWith(color: ColorsHelper.grayWords),
          ),
          SizedBox(height: AppResponsive.height(context, value: 10)),
          Row(
            children: [
              CustomIconsTitl(
                title: ' ${restaurant?.averageRating ?? 0}',
                iconUrl: AppIcons.iStar,
              ),
              SizedBox(width: AppResponsive.width(context, value: 12)),
              CustomIconsTitl(title: ' Free', iconUrl: AppIcons.iCar),
              SizedBox(width: AppResponsive.width(context, value: 12)),
              CustomIconsTitl(title: ' 20 min', iconUrl: AppIcons.iWatch),
            ],
          ),
        ],
      ),
    );
  }
}
