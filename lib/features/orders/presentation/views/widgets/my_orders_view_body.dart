import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/icons.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_order_item.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        ListView.builder(itemBuilder: (context, index) => CustomOrderItem(), itemCount: 5,),
      ],
    );
  }
}
