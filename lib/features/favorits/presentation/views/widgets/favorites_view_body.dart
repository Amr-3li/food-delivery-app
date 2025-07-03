import 'package:flutter/material.dart';
import 'package:restaurant/features/favorits/presentation/views/widgets/custom_favorites_item.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CustomFavoritesItem()]);
  }
}
