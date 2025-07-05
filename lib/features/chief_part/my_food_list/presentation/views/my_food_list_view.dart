import 'package:flutter/material.dart';
import 'package:restaurant/core/icons.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.iIcon),
          onPressed: () {
            Navigator.of(context).pop();
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
            child: FoodListBuilder(currentCategoryIndex: _currentCategoryIndex),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        context: context,
      ),
    );
  }
}
