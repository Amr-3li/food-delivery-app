import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/features/menu/presentation/views/widgets/menu_view_body.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/helper/app_responsive.dart';
import '../../../../core/icons.dart';
import '../../../../core/utils/color_helper.dart';
import '../../../../core/utils/styles.dart';
import '../../data/repo/menu/menu_repo_implemation.dart';
import '../manger/menu/menu_cubit.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

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
        title: Text('Profile', style: Styles.textStyle18),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kEditProfileView);
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: ColorsHelper.lightBabyBlue,
                child: SvgPicture.asset(AppIcons.assetsMoreHorizontal),
              ),
            ),
          ),
        ],
      ),
      body: MenuViewBody(),
    );
  }
}
