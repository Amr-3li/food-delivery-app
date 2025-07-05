import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/menu/data/repo/add_address/add_address_repo.dart';
import 'package:restaurant/features/menu/data/repo/add_address/add_address_repo_implemation.dart';
import 'package:restaurant/features/menu/presentation/manger/add_address/add_address_cubit.dart';
import 'package:restaurant/features/menu/presentation/views/add_new_address_view.dart';
import 'package:restaurant/features/menu/presentation/views/widgets/address_view_body.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/helper/app_responsive.dart';
import '../../../../core/icons.dart';
import '../../../../core/utils/color_helper.dart';
import '../../../../core/utils/styles.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('My Address', style: Styles.textStyle18),
      ),
      body: AddressViewBody(),
    );
  }
}
