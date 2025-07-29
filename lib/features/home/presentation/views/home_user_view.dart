import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:redacted/redacted.dart';

import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/helper/app_router.dart';
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

class HomeUserView extends StatefulWidget {
  const HomeUserView({super.key});

  @override
  State<HomeUserView> createState() => _HomeUserViewState();
}

class _HomeUserViewState extends State<HomeUserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SliverToBoxAdapter(child: CustomHomeAppBar()),
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
                              if (state is CategoryFailure) {
                                return Center(
                                  child: Text("Error: ${state.error}"),
                                );
                              } else if (BlocProvider.of<CategoryCubit>(
                                context,
                              ).categories.isNotEmpty) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: CategoryCubit.get(
                                    context,
                                  ).categories.length,
                                  itemBuilder: (context, index) {
                                    final category = CategoryCubit.get(
                                      context,
                                    ).categories[index];
                                    return CustomCategory(
                                      name: category.name,
                                      imageUrl:
                                          category.image ??
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXZylLZLdEOnpA7xCFv_tEqFvcThCY70wK7Q&s",
                                      onTap: () {
                                        context.push(
                                          AppRouter.kCategoryDetailsView,
                                          extra: category.id,
                                        );
                                      },
                                    );
                                  },
                                );
                              } else {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return CustomCategory().redacted(
                                      context: context,
                                      redact: true,
                                    );
                                  },
                                );
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
                      final cubit = RestaurantCubit.get(context);
                      if (cubit.restaurantsModel != null) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: CustomRestaurantInfo(
                                restaurant: cubit.restaurantsModel!.data[index],
                              ),
                            );
                          }, childCount: 5),
                        );
                      }
                      return SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.sp),
                            child: CustomRestaurantInfo().redacted(
                              context: context,
                              redact: true,
                            ),
                          );
                        }, childCount: 5),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
