import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/icons.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomFavoritesItem extends StatelessWidget {
  const CustomFavoritesItem({super.key});

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
                  color: ColorsHelper.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: CircleAvatar(
                  radius: AppResponsive.width(context, value: 14),
                  backgroundColor: ColorsHelper.orange,
                  child: SvgPicture.asset(
                    AppIcons.assetsFavoritesWhite,
                    width: AppResponsive.width(context, value: 16),
                    height: AppResponsive.height(context, value: 16),
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
                Text('pizza calzone european', style: Styles.textStyle18),
                const SizedBox(height: 8),
                Text(
                  'Prosciutto e funghi is a pizza variety that is topped with tomato sauce.',
                  style: Styles.textStyle14.copyWith(color: ColorsHelper.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$12.99',
                      style: Styles.textStyle16.copyWith(
                        color: ColorsHelper.orange,
                      ),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      AppIcons.assetsStar,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '4.5',
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
