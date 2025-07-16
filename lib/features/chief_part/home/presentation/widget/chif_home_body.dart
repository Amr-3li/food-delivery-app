import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chief_part/home/presentation/cubit/chef_statistics/chef_statistics_cubit.dart';
import 'package:restaurant/features/chief_part/home/presentation/cubit/chef_statistics/chef_statistics_state.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/order_form_sheet.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/order_widget.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/populer_food_builder.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/revenue_dashboard.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/reviews_summary.dart';

class ChifHomeBody extends StatefulWidget {
  const ChifHomeBody({super.key});

  @override
  State<ChifHomeBody> createState() => _ChifHomeBodyState();
}

class _ChifHomeBodyState extends State<ChifHomeBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<ChefStatisticsCubit, ChefStatisticsState>(
        buildWhen: (previous, current) {
          return previous.runtimeType != current.runtimeType;
        },
        builder: (context, state) {
          if (state is ChefStatisticsLoaded) {
            return _buildLoadedView(context, state);
          } else if (state is ChefStatisticsError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildLoadedView(BuildContext context, ChefStatisticsLoaded state) {
    return ListView(
      children: [
        Row(
          children: [
            Expanded(
              child: OrdersWidget(
                count: state.statistics.runningOrders,
                subtext: 'running order',
                onTap: () => OrderFormSheet.show(context),
              ),
            ),
            Expanded(
              child: OrdersWidget(
                count: state.statistics.pendingOrders,
                subtext: 'order quest',
                onTap: () => OrderFormSheet.show(context),
              ),
            ),
          ],
        ),
        const RevenueDashboard(),
        const ReviewsSummary(rating: 4.1, reviewCount: 20),
        const PopularFoodBuilder(),
      ],
    );
  }
}
