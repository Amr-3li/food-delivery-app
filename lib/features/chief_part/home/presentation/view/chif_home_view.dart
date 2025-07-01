import 'package:flutter/material.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/custom_appbar.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/custom_button_nvigation.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/order_form_sheet.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/order_widget.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/populer_food_builder.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/revenue_dashboard.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/reviews_summary.dart';

class ChifHomeView extends StatelessWidget {
  const ChifHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        dynamicText: "Hotel Lab",
        onLeadingPressed: () {
          print("Leading button pressed");
        },
        userImageUrl:
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: OrdersWidget(
                      count: 20,
                      subtext: 'running order',
                      onTap: () => OrderFormSheet.show(context),
                    ),
                  ),
                  Expanded(
                    child: OrdersWidget(
                      count: 5,
                      subtext: 'order quest',
                      onTap: () => OrderFormSheet.show(context),
                    ),
                  ),
                ],
              ),
            ),
            RevenueDashboard(),
            const ReviewsSummary(rating: 4.1, reviewCount: 20),
            const PopularFoodBuilder(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
