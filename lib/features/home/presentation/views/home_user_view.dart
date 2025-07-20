import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_category_card.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_restaurants_info.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_search.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custon_subtitle.dart';
import 'package:sizer/sizer.dart';

import '../cubit/category/category_cubit.dart';
import '../cubit/category/category_state.dart';
import '../cubit/resturant/resturant_cubit.dart';
import '../cubit/resturant/resturant_state.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CategoryCubit>()..fetchCategories(),
        ),
        BlocProvider(create: (_) => RestaurantCubit(sl())..getRestaurants()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.only(
                  top: AppResponsive.height(context, value: 30),
                  left: AppResponsive.width(context, value: 12),
                  right: AppResponsive.width(context, value: 12),
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: AppResponsive.width(context, value: 20),
                        ),
                        child: CustomHomeAppBar(),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: AppResponsive.height(context, value: 10),
                      ),
                    ),
                    SliverToBoxAdapter(child: SearchButton()),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: AppResponsive.height(context, value: 25),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SubTitleAllCategories(
                        subTitle: "All Categories",
                        onTap: () {
                          context.push(AppRouter.kAllCategoryView);
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: AppResponsive.height(context, value: 10),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox(
                            height: AppResponsive.height(context, value: 200),
                            child: BlocBuilder<CategoryCubit, CategoryState>(
                              builder: (context, state) {
                                if (state is CategoryLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is CategoryFailure) {
                                  return Center(
                                    child: Text("Error: ${state.error}"),
                                  );
                                } else if (state is CategorySuccess) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.categories.length,
                                    itemBuilder: (context, index) {
                                      final category = state.categories[index];
                                      return CustomCategory(
                                        name: category.name,
                                        imageUrl:
                                            category.image ??
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXZylLZLdEOnpA7xCFv_tEqFvcThCY70wK7Q&s",
                                        onTap: () {
                                          context.push(
                                            AppRouter.kFoodDetailsScreenView,
                                            extra: category.id,
                                          );
                                        },
                                      );
                                    },
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: AppResponsive.height(context, value: 16),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SubTitleAllCategories(
                        subTitle: "Open Restaurants",
                        onTap: () {
                          context.push(AppRouter.kAllRestaurantsView);
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: AppResponsive.height(context, value: 16),
                      ),
                    ),
                    BlocBuilder<RestaurantCubit, RestaurantState>(
                      builder: (context, state) {
                        if (state is RestaurantLoading) {
                          return const SliverToBoxAdapter(
                            child: Center(child: CircularProgressIndicator()),
                          );
                        } else if (state is RestaurantLoaded) {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final restaurant = state.restaurants[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.sp),
                                child: CustomRestorantInfo(
                                  restaurant: restaurant,
                                ),
                              );
                            }, childCount: state.restaurants.length),
                          );
                        } else if (state is RestaurantError) {
                          return SliverToBoxAdapter(
                            child: Center(child: Text(state.message)),
                          );
                        } else {
                          return const SliverToBoxAdapter(
                            child: SizedBox.shrink(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
