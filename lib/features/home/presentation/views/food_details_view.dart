import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/home/data/repository/meal_details_repository.dart';
import 'package:restaurant/features/home/presentation/cubit/meal_details/meal_details_cubit.dart';
import 'package:restaurant/features/home/presentation/views/widgets/food_details_view_body.dart';

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MealDetailsCubit(MealDetailsRepository())..getMealDetails(id: id),
        child: FoodDetailsViewBody(),
      ),
    );
  }
}
