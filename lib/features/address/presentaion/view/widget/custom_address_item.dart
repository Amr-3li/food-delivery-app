import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/address/presentaion/manger/get_addresses/get_addresses_cubit.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/helper/app_router.dart';
import '../../../data/model/address_model.dart';

class CustomAddressItem extends StatelessWidget {
  const CustomAddressItem({
    super.key,required this.addressModel,

  });

  final AddressesModel addressModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsHelper.grey.withAlpha(80),
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (addressModel.name == 'Other')
          SizedBox(width: 10,),
          if (addressModel.name != 'Other')
          CircleAvatar(
            radius: 24,
            backgroundColor: ColorsHelper.white,
            child: SvgPicture.asset(addressModel.name == 'Home' ? AppIcons.assetsHome : AppIcons.assetsBag),
          ),
          if (addressModel.name != 'Other')
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(addressModel.name ?? '', style: Styles.textStyle16),
                    Spacer(),
                    GestureDetector(
                        onTap: () async {
                          final result = await GoRouter.of(context).push(AppRouter.kAddAddressView, extra: addressModel);
                          if (result == true) {
                            GetAddressesCubit.get(context).getAddresses();
                          }
                        },
                        child: SvgPicture.asset(AppIcons.assetsEdit)),
                    SizedBox(width: 8),
                    GestureDetector(
                        onTap: () {
                          GetAddressesCubit.get(context).deleteAddress(addressId: addressModel.id!);
                        },
                        child: SvgPicture.asset(AppIcons.assetsDelete)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(addressModel.displayName ?? '', overflow: TextOverflow.ellipsis, maxLines: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
