import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/contact_helper.dart';
import 'package:restaurant/core/utils/assets_data.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../../data/models/meal_details_model.dart';
import 'custom_contact_info.dart';

class ChefDetailsViewBody extends StatelessWidget {
  const ChefDetailsViewBody({super.key, required this.chefModel});

  final ChefModel chefModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 65,
            backgroundColor: ColorsHelper.orange.withAlpha(50),
            child: Image.asset(
              AssetsData.assetsChefProfileImage,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(chefModel.name ?? '', style: Styles.textStyle16),
          SizedBox(height: 20),
          Text(
            chefModel.bio ?? '',
            style: Styles.textStyle14.copyWith(color: ColorsHelper.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          CustomContactInfo(
            text: chefModel.email ?? '',
            image: AppIcons.assetsEmailIcon,
            onTap: () {
              ContactHelper.sendEmail(toEmail: chefModel.email ?? '');
            },
          ),
          SizedBox(height: 20),
          CustomContactInfo(
            text: chefModel.phone ?? '',
            image: AppIcons.assetsPhoneIcon,
            onTap: () {
              ContactHelper.makePhoneCall(chefModel.phone ?? '');
            },
          ),
          SizedBox(height: 20),
          CustomContactInfo(text: 'Message', image: AppIcons.assetsChatIcon),
        ],
      ),
    );
  }
}


