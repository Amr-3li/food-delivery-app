import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant/features/home/presentation/views/widgets/custom_restaurants_info.dart';

import '../../cubit/resturant/resturant_cubit.dart';
import '../../cubit/resturant/resturant_state.dart';

class AllRestaurantsViewBody extends StatelessWidget {
  const AllRestaurantsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantCubit, RestaurantState>(
      builder: (context, state) {
        final cubit = RestaurantCubit.get(context);
        if (cubit.restaurantsModel != null) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            itemBuilder: (context, index) => CustomRestaurantInfo(
              restaurant: cubit.restaurantsModel!.data[index],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16,),
            itemCount: cubit.restaurantsModel!.data.length,
          );
        }
        return LinearProgressIndicator(color: Colors.orange,);
      },
    );
  }
}
