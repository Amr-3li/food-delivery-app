import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/features/address/data/model/address_details_model.dart';
import 'package:restaurant/features/address/presentaion/widget/custom_add_address_filed.dart';
import 'package:restaurant/features/menu/presentation/views/widgets/custom_label_selection.dart';

class AddNewAddressViewBody extends StatelessWidget {
  const AddNewAddressViewBody({super.key, this.addressDetailsModel});

  final AddressDetailsModel? addressDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAddAddressFiled(
              title: 'Address',
              text: addressDetailsModel?.displayName ?? '',
              icon: Icons.location_on,
              width: AppResponsive.width(context, value: 340),
              height: AppResponsive.height(context, value: 50),
            ),
            SizedBox(height: AppResponsive.height(context, value: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomAddAddressFiled(
                    title: 'City',
                    text: addressDetailsModel?.address?.city ?? '',
                    width: AppResponsive.width(context, value: 156),
                    height: AppResponsive.height(context, value: 50),
                  ),
                ),
                Expanded(
                  child: CustomAddAddressFiled(
                    title: 'Post code',
                    text: addressDetailsModel?.address?.postcode ?? '',
                    width: AppResponsive.width(context, value: 156),
                    height: AppResponsive.height(context, value: 50),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppResponsive.height(context, value: 20)),
            CustomAddAddressFiled(
              title: 'Country',
              text: addressDetailsModel?.address?.country ?? '',
              width: AppResponsive.width(context, value: 340),
              height: AppResponsive.height(context, value: 50),
            ),
            SizedBox(height: AppResponsive.height(context, value: 20)),
            CustomLabelSelection(),
            SizedBox(height: AppResponsive.height(context, value: 20)),
            CustomElevatedButton(
              buttonText: 'Save location',
              onPressedFunction: () {
                GoRouter.of(context).push(AppRouter.kAddresses);
              },
              buttonColor: ColorsHelper.orange,
            ),
          ],
        ),
      ),
    );
  }
}
