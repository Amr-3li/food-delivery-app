import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/food_cubit/food_cubit.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/manager/food_cubit/food_state.dart';

class SaveChangeButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SaveChangeButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodCubit, FoodState>(
      listener: (context, state) {
        if (state is FoodError) {
        } else if (state is FoodSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                final state = context.read<FoodCubit>().state;
                if (state is FoodLoaded) {
                  print('Trying to save: ${state.foodDetails.toMap()}');
                }
                try {
                  await context.read<FoodCubit>().saveFoodDetails();
                } catch (e) {
                  print('Save failed: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade800,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              child: Text(
                'SAVE CHANGES',
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
