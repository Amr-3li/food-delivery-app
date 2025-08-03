import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/address/presentaion/manger/get_addresses/get_addresses_cubit.dart';
import 'package:restaurant/features/cart/data/models/cart_model.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_states.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/back_icon_appbar.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/cart_item_container.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/container_bottom_navigator_bar.dart';
import 'package:restaurant/features/payment/presentaion/cubit/payment_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:svg_flutter/svg.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CartCubit>()..getCart()),
        BlocProvider(create: (_) => sl<PaymentCubit>()),
        BlocProvider(create: (_) => sl<GetAddressesCubit>()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 22,
                backgroundColor: ColorsHelper.lightBabyBlue,
                child: SvgPicture.asset(AppIcons.iIcon),
              ),
            ),
          ),
          toolbarHeight: AppResponsive.height(context, value: 80),
          title: Text('Cart', style: Styles.textStyle18),
          actions: [
            TextButton(
              onPressed: () async {
                if (context.read<CartCubit>().cartModel!.items.isNotEmpty) {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Clear Cart"),
                      content: Text(
                        "Are you sure you want to clear the cart? ",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: Text(
                            "Cancel",
                            style: Styles.textStyle16.copyWith(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: Text(
                            "Clear",
                            style: Styles.textStyle16.copyWith(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                  if (confirm == true) {
                    // ignore: use_build_context_synchronously
                    context.read<CartCubit>().clearCart();
                  }
                }
              },
              child: Text(
                'Clear Cart',
                style: Styles.textStyle16.copyWith(color: Colors.orange),
              ),
            ),
          ],
        ),
        body: BlocBuilder<CartCubit, CartStates>(
          builder: (context, state) {
            final cartCubit = context.read<CartCubit>();
            if (state is CartLoadingState) {
              return const LinearProgressIndicator(
                backgroundColor: Colors.orange,
              );
            } else if (state is CartFailureState) {
              return Center(
                child: Text(state.errorMessage, style: Styles.textStyle14),
              );
            } else if (state is CartSuccessState) {
              final cart = cartCubit.cartModel;
              if (cart == null || cart.items.isEmpty) {
                return Center(
                  child: Text('Your cart is empty', style: Styles.textStyle14),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.only(bottom: 10.h),
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return CartItemContainer(
                    imageName: item.dish.image,
                    title: item.dish.name,
                    price: '\$ ${(item.price).toStringAsFixed(1)}',
                    portionWidget: BlocBuilder<CartCubit, CartStates>(
                      buildWhen: (previous, current) =>
                          current is CartSuccessState,
                      builder: (context, state) {
                        final quantity =
                            context
                                .read<CartCubit>()
                                .cartModel
                                ?.items[index]
                                .quantity ??
                            0;
                        return Text("$quantity", style: Styles.textStyle16);
                      },
                    ),
                    removeItemCart: () {
                      context.read<CartCubit>().deleteCartItem(item.dishId);
                    },
                    onTapAdd: () {
                      context.read<CartCubit>().updateCartItem(
                        itemId: item.dishId,
                        quantity: item.quantity + 1,
                      );
                    },
                    onTapRemove: () {
                      if (item.quantity > 1) {
                        context.read<CartCubit>().updateCartItem(
                          itemId: item.dishId,
                          quantity: item.quantity - 1,
                        );
                      }
                    },
                  );
                },
              );
            }
            return Center(
              child: Text('No cart data available', style: Styles.textStyle14),
            );
          },
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            return ContainerBottomNavigator(
              total: context.read<CartCubit>().cartModel?.total ?? 0.0,
            );
          },
        ),
      ),
    );
  }
}
