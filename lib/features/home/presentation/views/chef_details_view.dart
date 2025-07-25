import 'package:flutter/material.dart';
import 'package:restaurant/features/home/data/models/meal_details_model.dart';
import 'package:restaurant/features/home/presentation/views/widgets/chef_details_view_body.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/color_helper.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/styles.dart';

class ChefDetailsView extends StatelessWidget {
  const ChefDetailsView({super.key, required this.chefModel});

  final ChefModel chefModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              radius: 22,
              backgroundColor: ColorsHelper.lightBabyBlue,
              child: SvgPicture.asset(AppIcons.iIcon),
            ),
          ),
        ),
        title: Text('Chef Profile', style: Styles.textStyle18),
      ),
      body: ChefDetailsViewBody(chefModel: chefModel,),
    );
  }
}
