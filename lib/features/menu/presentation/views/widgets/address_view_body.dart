import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/features/menu/presentation/views/widgets/custom_address_item.dart';

import '../../../../../core/icons.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CustomAddressItem(
                address: '2464 Royal Ln. Mesa, New Jersey 45463',
                icon: AppIcons.assetsHome,
                title: 'Home',
              ),
              separatorBuilder: (context, index) => SizedBox(height: 14),
              itemCount: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomElevatedButton(
              buttonText: 'Add New Address',
              onPressedFunction: () {
                context.push(AppRouter.kAddAddressView);
              },
              buttonColor: ColorsHelper.orange,
            ),
          ),
        ],
      ),
    );
  }
}
