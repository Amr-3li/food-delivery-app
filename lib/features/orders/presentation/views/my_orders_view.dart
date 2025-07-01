import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/icons.dart';
import '../../../../core/utils/color_helper.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: ColorsHelper.lightBabyBlue,
              child: SvgPicture.asset(AppIcons.iIcon),
            ),
          ),
          toolbarHeight: AppResponsive.height(context, value: 80),
          title: Text('My Orders'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: ColorsHelper.lightBabyBlue,
                child: SvgPicture.asset(AppIcons.assetsMoreHorizontal),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: ColorsHelper.orange,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: ColorsHelper.orange, width: 2.0),
              insets: EdgeInsets.symmetric(horizontal: 100),
            ),
            labelStyle: Styles.textStyle18.copyWith(
              color: ColorsHelper.orange,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.normal,
              color: ColorsHelper.grey,
            ),
            tabs: [
              Tab(text: 'Ongoing'),
              Tab(text: 'History'),
            ],
          ),
        ),
      ),
    );
  }
}
