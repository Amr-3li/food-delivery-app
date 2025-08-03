import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';

import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/features/address/data/model/address_model.dart';
import 'package:restaurant/features/address/presentaion/manger/get_addresses/get_addresses_cubit.dart';

import 'custom_address_item.dart';

class AddressViewBody extends StatelessWidget {
  const AddressViewBody({super.key, this.addressModel});

  final List<AddressesModel>? addressModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        children: [
          if (addressModel != null)
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => CustomAddressItem(
                  addressModel: addressModel![index],
                ),
                separatorBuilder: (context, index) => SizedBox(height: 14),
                itemCount: addressModel!.length,
              ),
            ),
          if (addressModel == null) Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: CustomElevatedButton(
              buttonText: 'Add New Address',
              onPressedFunction: () async {
                final result = await context.push(AppRouter.kAddAddressView);
                if (result == true) {
                  GetAddressesCubit.get(context).getAddresses();
                }
              },
              buttonColor: ColorsHelper.orange,
            ),
          ),
        ],
      ),
    );
  }
}
