import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/features/home/presentation/views/widgets/custom_network_image.dart';
import 'package:restaurant/features/orders/presentation/manger/my_orders_cubit.dart';

import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../data/models/my_orders_model.dart';

class CustomOrderItem extends StatelessWidget {
  const CustomOrderItem({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Food', style: Styles.textStyle16),
              if (item.order?.orderStatus == 'completed' || item.order?.orderStatus == 'cancelled')
                SizedBox(width: 18),
              if (item.order?.orderStatus == 'completed' || item.order?.orderStatus == 'cancelled')
                Text(
                  item.order?.orderStatus ?? '',
                  style: Styles.textStyle16.copyWith(
                    color: item.order?.orderStatus == 'completed' ? ColorsHelper.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),
          Divider(color: ColorsHelper.grey.withAlpha(80), thickness: 1),
          SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(imageUrl: item.dishImage ?? '', width: 60, height: 60),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.dishName ?? '', style: Styles.textStyle16),
                        Spacer(),
                        Expanded(
                          child: Text(
                            item.order?.orderNumber ?? '',
                            style: Styles.textStyle16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text('\$ ${item.totalPrice}', style: Styles.textStyle14),
                        SizedBox(width: 8),
                        Text('|', style: Styles.textStyle14),
                        SizedBox(width: 8),
                        if (item.order?.orderStatus == 'completed' ||
                            item.order?.orderStatus == 'cancelled')
                          Text('29 Jan, 12:30', style: Styles.textStyle14),
                        if (item.order?.orderStatus == 'completed' ||
                            item.order?.orderStatus == 'cancelled')
                          SizedBox(width: 8),
                        Text(item.quantity.toString() ?? '', style: Styles.textStyle14),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppResponsive.width(context, value: 140),
                height: AppResponsive.height(context, value: 40),
                child: CustomElevatedButton(
                  buttonText:
                  item.order?.orderStatus == 'completed' ||
                      item.order?.orderStatus == 'cancelled'
                      ? 'Rate'
                      : 'Complete',
                  onPressedFunction: () {
                    if (item.order?.orderStatus == 'completed' ||
                        item.order?.orderStatus == 'cancelled') {
                      print('-----------------------------------------------------------------------------${item.id}');
                      /// Error Server --------------------
                      context.push(AppRouter.kFoodDetailsView, extra: item.id);
                    } else {
                      MyOrdersCubit.get(context).changeOrderStatus(id: item.order!.orderId!, status: 'completed');
                    }
                  },
                  buttonColor:
                  item.order?.orderStatus == 'completed' ||
                      item.order?.orderStatus == 'cancelled'
                      ? ColorsHelper.white
                      : ColorsHelper.orange,
                  textColor:
                  item.order?.orderStatus == 'completed' ||
                      item.order?.orderStatus == 'cancelled'
                      ? ColorsHelper.orange
                      : ColorsHelper.white,
                ),
              ),
              SizedBox(
                width: AppResponsive.width(context, value: 140),
                height: AppResponsive.height(context, value: 40),
                child: CustomElevatedButton(
                  buttonText:
                  item.order?.orderStatus == 'completed' ||
                      item.order?.orderStatus == 'cancelled'
                      ? 'Re-Order'
                      : 'Cancel',
                  onPressedFunction: () {
                    if (item.order?.orderStatus == 'completed' ||
                        item.order?.orderStatus == 'cancelled') {
                      context.go(AppRouter.kHomeUserView);
                    } else {
                      MyOrdersCubit.get(context).changeOrderStatus(id: item.order!.orderId!, status: 'cancelled');
                    }
                  },
                  buttonColor:
                  item.order?.orderStatus == 'completed' ||
                      item.order?.orderStatus == 'cancelled'
                      ? ColorsHelper.orange
                      : ColorsHelper.white,
                  textColor:
                  item.order?.orderStatus == 'completed' ||
                      item.order?.orderStatus == 'cancelled'
                      ? ColorsHelper.white
                      : ColorsHelper.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
