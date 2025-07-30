import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/favorits/presentation/manger/favorites/favorites_cubit.dart';
import 'package:restaurant/features/favorits/presentation/views/widgets/custom_favorites_item.dart';

import '../../../../../core/utils/app_toast.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if (state is AddToFavoritesSuccess) {
          AppToast.showSuccessToast(state.message);
        } else if (state is AddToFavoritesFailure) {
          AppToast.showErrorToast(state.error);
        } else if (state is DeleteFromFavoritesSuccess) {
          AppToast.showSuccessToast(state.message);
        } else if (state is DeleteFromFavoritesFailure) {
          AppToast.showErrorToast(state.error);
        }
      },
      builder: (context, state) {
        final favoritesCubit = FavoritesCubit.get(context);
        if (favoritesCubit.favoritesModel != null) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
            child: ListView.separated(
              itemBuilder: (context, index) => CustomFavoritesItem(meal: favoritesCubit.favoritesModel!.data[index], favoritesCubit: favoritesCubit,),
              separatorBuilder: (context, index) => Divider(indent: 16, endIndent: 16,),
              itemCount: favoritesCubit.favoritesModel!.data.length,
            ),
          );
        }
        return LinearProgressIndicator(color: Colors.orange,);
      },
    );
  }
}
