import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';
import '../../cubit/category/category_cubit.dart';
import '../../cubit/category/category_state.dart';
import 'categories_grid_view.dart';
import 'custom_category_card.dart';
import 'custom_label.dart';
import 'meals_types_grid_view.dart';

class AllCategoriesViewBody extends StatefulWidget {
  const AllCategoriesViewBody({super.key});

  @override
  State<AllCategoriesViewBody> createState() => _AllCategoriesViewBodyState();
}

class _AllCategoriesViewBodyState extends State<AllCategoriesViewBody> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<String> labels = ['Categories', 'Meals Types'];

  void _onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: List.generate(labels.length, (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index == 0 ? 6 : 0,
                    left: index == 1 ? 6 : 0,
                  ),
                  child: CustomLabel(
                    name: labels[index],
                    isSelected: selectedIndex == index,
                    onTap: () => _onTabSelected(index),
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 10),
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    if (CategoryCubit.get(context).categories.isNotEmpty) {
                      return CategoriesGridView(
                        categories: CategoryCubit.get(context).categories,
                      );
                    }
                  } else {
                    if (CategoryCubit.get(context).mealsTypes.isNotEmpty) {
                      return MealsTypeGridView(
                        mealsTypes: CategoryCubit.get(context).mealsTypes,
                      );
                    }
                  }
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.85,
                        ),
                    itemCount: 10,
                    itemBuilder: (context, index) => CustomCategory().redacted(
                      context: context,
                      redact: true,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
