import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_appbar.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_category_card.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_restaurants_info.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custom_search.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/custon_subtitle.dart';
import 'package:sizer/sizer.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppResponsive.height(context, value: 30),
            left: AppResponsive.width(context, value: 20),
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
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Text(
                      "Hey Hala,",
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text("Good Afternoon,", style: Styles.textStyle16),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SearchButton(
                  onTap: () {
                    // context.push(AppRouter.)
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: AppResponsive.height(context, value: 25),
                ),
              ),
              SliverToBoxAdapter(
                child: SubTitleAllCategories(
                  subTitle: "All Categories",
                  onTap: () {
                    // context.push(kCategories)
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: AppResponsive.height(context, value: 10),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: AppResponsive.height(context, value: 200),

                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CustomCategory();
                    },
                  ),
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
                    context.push(AppRouter.krestaurantView);
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: AppResponsive.height(context, value: 16),
                ),
              ),
              SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.sp),
                    child: CustomRestorantInfo(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
