import 'package:flutter/material.dart';
import 'package:restaurant/features/reviews/presentation/views/widgets/my_reviews_view_body.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/helper/app_responsive.dart';
import '../../../../core/utils/color_helper.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/styles.dart';

class MyReviewsView extends StatelessWidget {
  const MyReviewsView({super.key});

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
        title: Text('My Reviews', style: Styles.textStyle18),
      ),
      body: MyReviewsViewBody(),
    );
  }
}
