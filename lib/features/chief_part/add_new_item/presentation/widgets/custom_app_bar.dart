import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/food_cubit/food_cubit.dart';
import 'package:svg_flutter/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppIcons.iIcon),
        ),
        const SizedBox(width: 8),
        Text(
          'Add New Item',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        Spacer(flex: 1),
        TextButton(
          onPressed: () => context.read<FoodCubit>().resetForm(),
          child: Text(
            'Reset',
            style: Styles.textStyle16.copyWith(color: Colors.orange),
          ),
        ),
      ],
    );
  }
}
