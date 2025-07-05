import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';

import '../../../../../core/utils/color_helper.dart';

import '../../../data/models/menu_model.dart';
import 'custom_menu_item.dart';

class CustomMenuList extends StatelessWidget {
  const CustomMenuList({
    super.key,
    required this.menuGroup,
    required this.onTap,
  });

  final MenuGroup menuGroup;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorsHelper.grey.withAlpha(60),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: menuGroup.items
            .map(
              (item) => CustomMenuItem(
                name: item.title,
                icon: item.icon,
                data: item.data,
                onTap: item.route != null
                    ? () => context.push(item.route!)
                    : null,
              ),
            )
            .toList(),
      ),
    );
  }
}
