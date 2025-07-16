import 'package:flutter/material.dart';
import 'package:restaurant/core/assets_data.dart';
import 'package:restaurant/features/menu/data/models/customer_profile_model.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomUserInfo extends StatelessWidget {
  const CustomUserInfo({super.key, this.userModel});

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (userModel?.profileImage == null)
        CircleAvatar(radius: 50, backgroundColor: ColorsHelper.orangeGrey, child: Image.asset(AssetsData.defaultUserImage, height: 70, width: 70, fit: BoxFit.cover,)),
        if (userModel?.profileImage != null)
        CircleAvatar(radius: 50, backgroundImage: NetworkImage(userModel!.profileImage!),),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userModel?.name ?? '', style: Styles.textStyle20),
            const SizedBox(height: 4),
            Text(
              userModel?.bio ?? '',
              style: Styles.textStyle14.copyWith(
                color: ColorsHelper.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}