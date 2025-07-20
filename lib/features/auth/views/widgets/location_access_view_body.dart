import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/features/auth/manger/location_access/location_access_cubit.dart';

import '../../../../core/helper/app_router.dart';

class LocationAccessViewBody extends StatelessWidget {
  const LocationAccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationAccessCubit, LocationAccessState>(
      listener: (context, state) {
        if (state is LocationAccessError) {
          AppToast.showErrorToast(state.error);
        } else if (state is LocationAccessSuccess) {
          GoRouter.of(
            context,
          ).push(AppRouter.kHomeUserView);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppIcons.assetsLocationAccess),
            const SizedBox(height: 24),
            CustomElevatedButton(
              buttonText: 'ACCESS LOCATION',
              onPressedFunction: () {
                BlocProvider.of<LocationAccessCubit>(context).requestLocationAccessPermission();
              },
              buttonColor: ColorsHelper.orange,
            ),
            const SizedBox(height: 24),
            Text(
              'FOOD DELIVERY WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP',
              textAlign: TextAlign.center,
              style: Styles.textStyle16,
            ),
          ],
        ),
      ),
    );
  }
}
