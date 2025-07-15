import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/chief_part/home/data/repository/running_order/running_orders_repository.dart';
import 'package:restaurant/features/chief_part/home/presentation/cubit/running_order/running_orders_cubit.dart';
import 'package:restaurant/features/chief_part/home/presentation/cubit/running_order/running_orders_state.dart';
import 'food_order_card.dart';

class OrderFormSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BlocProvider(
          create: (context) =>
              RunningOrdersCubit(RunningOrdersRepositoryImpl(ApiHelper()))
                ..fetchRunningOrders(),
          child: _OrderFormContent(),
        );
      },
    );
  }
}

class _OrderFormContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppResponsive.height(context, value: 812 * 0.8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Running Orders',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocBuilder<RunningOrdersCubit, RunningOrdersState>(
              builder: (context, state) {
                if (state is RunningOrdersLoaded) {
                  if (state.orders.isEmpty) {
                    return const Center(
                      child: Text(
                        'There are no running orders',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      final order = state.orders[index];
                      final firstItem = order.items.first;
                      return FoodOrderCard(
                        category: '#${order.status.replaceAll('_', ' ')}',
                        foodName: firstItem.dishName,
                        foodId: order.id.toString(),
                        price: '\$${order.total.toStringAsFixed(2)}',
                        onDonePressed: () =>
                            _handleOrderAction(context, order.id, 'done'),
                        onCancelPressed: () =>
                            _handleOrderAction(context, order.id, 'cancel'),
                        imageUrl: firstItem.dish.image,
                      );
                    },
                  );
                } else if (state is RunningOrdersError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  void _handleOrderAction(BuildContext context, int orderId, String action) {
    final cubit = context.read<RunningOrdersCubit>();
    cubit
        .updateOrderStatus(orderId, action)
        .then((_) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Order #$orderId marked as $action')),
          );
        })
        .catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update order: $error')),
          );
        });
  }
}
