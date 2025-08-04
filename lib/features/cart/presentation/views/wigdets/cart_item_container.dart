import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/add_remove_container.dart';
import 'package:sizer/sizer.dart';

import '../../../../home/presentation/views/widgets/custom_network_image.dart';
import '../../../data/models/cart_model.dart';
import '../../cubit/cart_states.dart';

class CartItemContainer extends StatelessWidget {
  const CartItemContainer({
    super.key, required this.item,
  });
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.withAlpha(60),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            // Product Image
            CustomNetworkImage(imageUrl: item.dish?.image ?? '', height: 100, width: 100),

            SizedBox(width: 12),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Close button row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(item.dish?.name ?? '', style: Styles.textStyle16)),
                      GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().deleteCartItem(item.dishId!);
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 18),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ ${item.price ?? ''}', style: Styles.textStyle18),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AddRemoveContainer(
                            onTap: () {
                              if (item.quantity! > 1) {
                                context.read<CartCubit>().updateCartItem(
                                  itemId: item.dishId!,
                                  quantity: item.quantity! - 1,
                                );
                              }
                            },
                            text: "-",
                            containerColor: Colors.white,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(item.quantity.toString(), style: Styles.textStyle16),
                          ),

                          AddRemoveContainer(
                            onTap: () {
                              context.read<CartCubit>().updateCartItem(
                                itemId: item.dishId!,
                                quantity: item.quantity! + 1,
                              );
                            },
                            text: "+",
                            containerColor: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
