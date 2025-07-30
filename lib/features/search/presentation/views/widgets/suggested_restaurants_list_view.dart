import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';

import '../../../data/model/suggested_restaurants_model.dart';
import 'custom_suggested_restaurants_item.dart';

class SuggestedRestaurantsListView extends StatelessWidget {
  const SuggestedRestaurantsListView({super.key, required this.suggestedRestaurantsModel});

  final SuggestedRestaurantsModel suggestedRestaurantsModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppResponsive.height(context, value: 210),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => CustomSuggestedRestaurantsItem(
          name: suggestedRestaurantsModel.data[index].name ?? '',
          rating: suggestedRestaurantsModel.data[index].avgRating.toString(),
          image: suggestedRestaurantsModel.data[index].profileImage ?? '',
        ),
        separatorBuilder: (context, index) => Divider(color: Colors.grey, height: 1,),
        itemCount: suggestedRestaurantsModel.data.length,
      ),
    );
  }
}