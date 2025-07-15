import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/home_user/data/models/restaurant_model.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_icons_and_title.dart'
    show CustomIconsTitl;
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_network_image.dart';

class CustomRestorantInfo extends StatelessWidget {
  final RestaurantModel restaurant;

  const CustomRestorantInfo({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomNetworkImage(
          imageUrl:
              "https://popmenucloud.com/cdn-cgi/image/width%3D1200%2Cheight%3D1200%2Cfit%3Dscale-down%2Cformat%3Dauto%2Cquality%3D60/evuzicja/678850d5-0715-407f-92dd-499326242d71.jpg",
          width: 327,
          height: 140,
        ),
        Text(restaurant.name, style: Styles.textStyle20),
        Text(
          restaurant.description,
          style: Styles.textStyle14.copyWith(color: ColorsHelper.grayWords),
        ),
        SizedBox(height: AppResponsive.height(context, value: 10)),
        Row(
          children: [
            CustomIconsTitl(
              title: ' ${restaurant.averageRating}',
              iconUrl: AppIcons.iStar,
            ),
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
