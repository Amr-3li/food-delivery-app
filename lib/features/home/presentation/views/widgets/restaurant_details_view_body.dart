import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/home/presentation/cubit/resturant/resturant_cubit.dart';
import 'package:restaurant/features/home/presentation/cubit/resturant/resturant_state.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_network_image.dart';

import 'custom_food_item_card.dart';
import 'custom_icons_and_title.dart';
import 'custom_menu_items.dart';

class RestaurantDetailsViewBody extends StatelessWidget {
  const RestaurantDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        final cubit = RestaurantCubit.get(context);
        if (cubit.restaurantDetailsModel != null) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNetworkImage(
                  imageUrl: cubit.restaurantDetailsModel?.data?.resturant?.profileImage ?? '',
                  width: double.infinity,
                  height: 200,
                ),
                SizedBox(height: 10),
                Text(cubit.restaurantDetailsModel?.data?.resturant?.name ?? '', style: Styles.textStyle18),
                SizedBox(height: 6),
                Text(cubit.restaurantDetailsModel?.data?.resturant?.location ?? '',
                  style: Styles.textStyle18.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 6),
                Text(cubit.restaurantDetailsModel?.data?.resturant?.description ?? '',
                  style: Styles.textStyle16.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CustomIconsTitle(title: '4.7', iconUrl: AppIcons.iStar),
                    SizedBox(width: 18),
                    CustomIconsTitle(title: 'Free', iconUrl: AppIcons.iCar),
                    SizedBox(width: 18),
                    CustomIconsTitle(title: '20 min', iconUrl: AppIcons.iWatch),
                  ],
                ),
                SizedBox(height: 16),
                CustomMenuItems(categories: cubit.restaurantDetailsModel?.data?.menu?.categories ?? []),
                SizedBox(height: 16),
                Expanded(
                    child: CustomFoodItemCard(meals: cubit.meals)),
              ],
            ),
          );
        }
        return LinearProgressIndicator(color: Colors.orange);
      },
    );
  }
}