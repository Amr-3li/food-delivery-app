import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant/features/address/data/repo/get_addresses/get_addresses_repo_implemation.dart';

import 'package:restaurant/features/address/presentaion/manger/get_addresses/get_addresses_cubit.dart';
import 'package:restaurant/features/address/presentaion/view/widget/address_view_body.dart';

import 'package:svg_flutter/svg.dart';

import '../../../../core/helper/app_responsive.dart';
import '../../../../core/utils/icons.dart';
import '../../../../core/utils/color_helper.dart';
import '../../../../core/utils/styles.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetAddressesCubit(GetAddressesRepoImplementation())..getAddresses(),
      child: Scaffold(
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
          title: Text('My Address', style: Styles.textStyle18),
        ),
        body: BlocBuilder<GetAddressesCubit, GetAddressesState>(
          builder: (context, state) {
            if (GetAddressesCubit.get(context).addresses.isNotEmpty) {
              return AddressViewBody(
                addressModel: GetAddressesCubit.get(context).addresses,
              );
            }
            return AddressViewBody();
          },
        ),
      ),
    );
  }
}
