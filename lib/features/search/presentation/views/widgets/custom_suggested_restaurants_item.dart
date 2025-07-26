import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../home/presentation/views/widgets/custom_network_image.dart';

class CustomSuggestedRestaurantsItem extends StatelessWidget {
  const CustomSuggestedRestaurantsItem({
    super.key,
    required this.name,
    required this.rating,
    required this.image,
  });

  final String name;
  final String rating;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CustomNetworkImage(imageUrl: image, width: 60, height: 60,),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: Styles.textStyle16),
                SizedBox(height: 4,),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.assetsStar),
                    const SizedBox(width: 6),
                    Text(rating, style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w300)),
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
