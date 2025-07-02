import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/icons.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../data/models/menu_group_list.dart';
import 'custom_menu_list.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 18, right: 18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(radius: 50, backgroundColor: ColorsHelper.grey),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Vishal Khadok', style: Styles.textStyle20),
                    const SizedBox(height: 4),
                    Text(
                      'I love fast food',
                      style: Styles.textStyle14.copyWith(
                        color: ColorsHelper.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 28),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  CustomMenuList(menuGroup: menuGroups[index]),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: menuGroups.length,
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}
