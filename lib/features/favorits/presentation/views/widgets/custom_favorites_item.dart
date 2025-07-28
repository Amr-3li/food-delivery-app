import 'package:flutter/material.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_network_image.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/utils/icons.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/favorites_model.dart';
import '../../manger/favorites/favorites_cubit.dart';

class CustomFavoritesItem extends StatelessWidget {
  const CustomFavoritesItem({super.key,required this.meal,required this.favoritesCubit});

  final Datum meal;
  final FavoritesCubit favoritesCubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: AppResponsive.width(context, value: 100),
                height: AppResponsive.height(context, value: 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CustomNetworkImage(imageUrl: meal.dish?.image ?? '', width: 100, height: 100),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: GestureDetector(
                  onTap: () {
                    if (favoritesCubit.isFavorite) {
                      favoritesCubit.deleteFromFavorites(dishId: meal.dish!.id!);
                    } else {
                      favoritesCubit.addToFavorites(dishId: meal.dish!.id!);
                    }
                  },
                  child: CircleAvatar(
                    radius: AppResponsive.width(context, value: 14),
                    backgroundColor: ColorsHelper.lightBabyBlue,
                    child: favoritesCubit.isFavorite ? Icon(Icons.favorite, color: Colors.orange,) : Icon(Icons.favorite, color: Colors.grey,),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(meal.dish?.name ?? '', style: Styles.textStyle18),
                const SizedBox(height: 8),
                Text(
                  meal.dish?.description ?? '',
                  style: Styles.textStyle14.copyWith(color: ColorsHelper.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      AppIcons.assetsStar,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      meal.dish?.avgRate ?? '0',
                      style: Styles.textStyle14.copyWith(
                        color: ColorsHelper.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      AppIcons.assetsClock,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '30-40 min',
                      style: Styles.textStyle14.copyWith(
                        color: ColorsHelper.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(AppIcons.assetsCar, width: 16, height: 16),
                    const SizedBox(width: 4),
                    Text(
                      'Free',
                      style: Styles.textStyle14.copyWith(
                        color: ColorsHelper.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
