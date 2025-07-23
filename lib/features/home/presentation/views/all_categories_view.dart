import 'package:flutter/material.dart';
import 'package:restaurant/features/home/presentation/views/widgets/all_categories_view_body.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/helper/app_responsive.dart';
import '../../../../core/utils/color_helper.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/styles.dart';
import '../../data/models/category_model.dart';

class AllCategoriesView extends StatelessWidget {
  const AllCategoriesView({super.key});


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
        toolbarHeight: AppResponsive.height(context, value: 80),
        title: Text('All Categories', style: Styles.textStyle18),
      ),
      body: AllCategoriesViewBody(),
    );
  }
}
