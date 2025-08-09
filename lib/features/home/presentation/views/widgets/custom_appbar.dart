import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/cache/cache_data.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kMenuView);
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: ColorsHelper.orange.withAlpha(100),
            child: Image.asset(
              AssetsData.defaultUserImage,
              height: 25,
              width: 25,
            ),
          ),
        ),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey ${CacheData.userName},",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.normal),
            ),
            Text("Good Afternoon,", style: Styles.textStyle16),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kCartView);
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: ColorsHelper.blueBlack,
                child: SvgPicture.asset(AppIcons.assetsCart),
              ),
              if (context.read<CartCubit>().cartModel?.data?.cart?.items.isNotEmpty ?? false)
              Positioned(
                right: 0,
                top: 0,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.red,
                  child: Text(
                    context.read<CartCubit>().cartModel?.data?.cart?.items.length.toString() ?? '',
                    style: Styles.textStyle12.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
