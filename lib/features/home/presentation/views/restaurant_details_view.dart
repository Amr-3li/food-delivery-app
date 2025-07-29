import 'package:flutter/material.dart';
import 'package:restaurant/features/home/presentation/cubit/resturant/resturant_cubit.dart';
import 'package:restaurant/features/home/presentation/views/widgets/restaurant_details_view_body.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/helper/app_responsive.dart';
import '../../../../core/utils/color_helper.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/styles.dart';

class RestaurantDetailsView extends StatefulWidget {
  const RestaurantDetailsView({super.key, required this.id});

  final int id;

  @override
  State<RestaurantDetailsView> createState() => _RestaurantDetailsViewState();
}

class _RestaurantDetailsViewState extends State<RestaurantDetailsView> {

  @override
  void initState() {
    super.initState();
    RestaurantCubit.get(context).getRestaurantDetails(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              RestaurantCubit.get(context).meals = [];
            },
            child: CircleAvatar(
              radius: 22,
              backgroundColor: ColorsHelper.lightBabyBlue,
              child: SvgPicture.asset(AppIcons.iIcon),
            ),
          ),
        ),
        toolbarHeight: AppResponsive.height(context, value: 80),
        title: Text('Restaurant View', style: Styles.textStyle18),
      ),
      body: RestaurantDetailsViewBody(),
    );
  }
}
