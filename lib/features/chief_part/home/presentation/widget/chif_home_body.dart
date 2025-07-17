import 'package:flutter/material.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/order_form_sheet.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/order_widget.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/populer_food_builder.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/revenue_dashboard.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/reviews_summary.dart';

class ChifHomeBody extends StatelessWidget {
  const ChifHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: OrdersWidget(
                  count: 0,
                  subtext: 'running order',
                  onTap: () => OrderFormSheet.show(context),
                ),
              ),
              Expanded(
                child: OrdersWidget(
                  count: 0,
                  subtext: 'order quest',
                  onTap: () => OrderFormSheet.show(context),
                ),
              ),
            ],
          ),
          RevenueDashboard(),
          ReviewsSummary(),
          PopularFoodBuilder(),
        ],
      ),
    );
  }
}
