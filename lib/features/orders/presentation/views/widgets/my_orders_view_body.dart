import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/icons.dart';
import '../../../../../core/utils/styles.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: ColorsHelper.lightBabyBlue,
                      child: SvgPicture.asset(AppIcons.iIcon),
                    ),
                    SizedBox(width: 10),
                    Text('My Orders', style: Styles.textStyle18),
                    Spacer(),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: ColorsHelper.lightBabyBlue,
                      child: SvgPicture.asset(AppIcons.assetsMoreHorizontal),
                    ),
                  ],
                ),
              ),
              Row(children: [

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
