import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/features/orders/presentation/manger/my_orders_cubit.dart';

import 'custom_order_item.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyOrdersCubit, MyOrdersState>(
      listener: (context, state) {
        if (state is ChangeOrderStatusSuccess) {
          AppToast.showSuccessToast(state.message);
        } else if (state is ChangeOrderStatusFailure) {
          AppToast.showErrorToast(state.errorMessage);
        } else if (state is GetMyOrdersFailure) {
          AppToast.showErrorToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        final cubit = MyOrdersCubit.get(context);
        if (cubit.currentOrders.isNotEmpty || cubit.pastOrders.isNotEmpty || state is GetMyOrdersSuccess) {
          return TabBarView(
            children: [
              ListView.builder(
                itemBuilder: (context, index) =>
                    CustomOrderItem(item: cubit.currentOrders[index]),
                itemCount: cubit.currentOrders.length,
              ),
              ListView.builder(
                itemBuilder: (context, index) =>
                    CustomOrderItem(item: cubit.pastOrders[index]),
                itemCount: cubit.pastOrders.length,
              ),
            ],
          );
        }
        return Center(child: CircularProgressIndicator(color: Colors.orange, strokeWidth: 2.0, strokeAlign: 3,));
      },
    );
  }
}
