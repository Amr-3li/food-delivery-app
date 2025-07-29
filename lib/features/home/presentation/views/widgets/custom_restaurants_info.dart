import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/features/home/data/models/restaurants_model.dart';

import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/helper/app_router.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/icons.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_icons_and_title.dart';
import 'custom_network_image.dart';

class CustomRestaurantInfo extends StatelessWidget {
  const CustomRestaurantInfo({super.key, this.restaurant});

  final Datum? restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kRestaurantDetailsView, extra: restaurant!.id);
      },
      child: Column(
        children: [
          CustomNetworkImage(
            imageUrl:
                "https://popmenucloud.com/cdn-cgi/image/width%3D1200%2Cheight%3D1200%2Cfit%3Dscale-down%2Cformat%3Dauto%2Cquality%3D60/evuzicja/678850d5-0715-407f-92dd-499326242d71.jpg",
            width: double.infinity,
            height: 150,
          ),
          SizedBox(height: 6,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurant?.name ?? '', style: Styles.textStyle20),
                    Text(
                      restaurant?.location ?? '',
                      style: Styles.textStyle16.copyWith(color: ColorsHelper.grayWords),
                    ),
                  ],
                ),
                Spacer(),
                if (restaurant != null)
                restaurant!.status!.isOpen! ? Text('Open', style: Styles.textStyle16.copyWith(color: Colors.green)) : Text('Closed', style: Styles.textStyle16.copyWith(color: Colors.red)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
