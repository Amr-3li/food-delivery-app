import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/repository/food_list_repository_impl.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/cubit/food_list_cubit.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/widgets/category_nav_bar.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/widgets/food_list_builder.dart';
import 'package:restaurant/features/chief_part/widgets/custom_bottomnavigation_bar.dart';
import 'package:svg_flutter/svg.dart';

class MyFoodList extends StatefulWidget {
  const MyFoodList({super.key});

  @override
  State<MyFoodList> createState() => _MyFoodListState();
}

class _MyFoodListState extends State<MyFoodList> {
  int _currentCategoryIndex = 0;
  late FoodListCubit _foodListCubit;

  @override
  void initState() {
    super.initState();
    _foodListCubit = FoodListCubit(FoodListRepositoryImpl(ApiHelper()));
    _foodListCubit.fetchFoodItems();
  }

  @override
  void dispose() {
    _foodListCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _foodListCubit,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(AppIcons.iIcon),
            onPressed: () {
              GoRouter.of(context).go(AppRouter.kChifHome);
            },
          ),
          title: const Text('My Food List'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CategoryNavBar(
              initialIndex: _currentCategoryIndex,
              onCategorySelected: (index) {
                setState(() {
                  _currentCategoryIndex = index;
                });
              },
            ),
            Expanded(
              child: FoodListBuilder(
                currentCategoryIndex: _currentCategoryIndex,
              ),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: 1,
          context: context,
        ),
      ),
    );
  }
}
