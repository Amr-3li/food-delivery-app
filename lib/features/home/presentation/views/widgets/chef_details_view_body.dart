import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/helper/contact_helper.dart';
import 'package:restaurant/core/utils/assets_data.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/home/presentation/cubit/meal_details/meal_details_cubit.dart';

import '../../../../../core/utils/color_helper.dart';
import '../../../data/models/meal_details_model.dart';
import 'custom_contact_info.dart';

class ChefDetailsViewBody extends StatelessWidget {
  const ChefDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealDetailsCubit, MealDetailsState>(
      builder: (context, state) {
        final mealDetailsCubit = MealDetailsCubit.get(context);
        if (mealDetailsCubit.mealDetailsModel != null) {
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
                Text(mealDetailsCubit.mealDetailsModel?.data?.chef?.name ?? '', style: Styles.textStyle16),
                SizedBox(height: 20),
                Text(
                  mealDetailsCubit.mealDetailsModel?.data?.chef?.bio ?? '',
                  style: Styles.textStyle14.copyWith(color: ColorsHelper.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                CustomContactInfo(
                  text: mealDetailsCubit.mealDetailsModel?.data?.chef?.email ?? '',
                  image: AppIcons.assetsEmailIcon,
                  onTap: () {
                    if (mealDetailsCubit.mealDetailsModel!.data!.chef!.email!.isNotEmpty) {
                      ContactHelper.sendEmail(toEmail: mealDetailsCubit.mealDetailsModel!.data!.chef!.email!);
                    }
                  },
                ),
                SizedBox(height: 20),
                CustomContactInfo(
                  text: mealDetailsCubit.mealDetailsModel?.data?.chef?.phone ?? '',
                  image: AppIcons.assetsPhoneIcon,
                  onTap: () {
                    if (mealDetailsCubit.mealDetailsModel!.data!.chef!.phone!.isNotEmpty) {
                      ContactHelper.makePhoneCall(mealDetailsCubit.mealDetailsModel!.data!.chef!.phone!);
                    }

                  },
                ),
                SizedBox(height: 20),
                CustomContactInfo(
                  text: 'Message', image: AppIcons.assetsChatIcon, onTap: () {
                  MealDetailsCubit.get(context).makeConversation(
                      id: mealDetailsCubit.mealDetailsModel!.data!.chef!.id!).then((value) {
                    context.push(AppRouter.kChatView, extra: mealDetailsCubit.mealDetailsModel!.data?.chef);
                  },);
                },),
              ],
            ),
          );
        }

        return LinearProgressIndicator(color: ColorsHelper.orange,);
      },
    );
  }
}


