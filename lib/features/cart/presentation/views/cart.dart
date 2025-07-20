import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/address/presentaion/manger/get_addresses/get_addresses_cubit.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_states.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/back_icon_appbar.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/cart_item_container.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/container_bottom_navigator_bar.dart';
import 'package:restaurant/features/payment/presentaion/cubit/payment_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:svg_flutter/svg.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  String addressTitle = "2118 Thornridge Cir. Syracuse";

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // ✅ FIX: Call getCart immediately when providing CartCubit
        BlocProvider(create: (_) => sl<CartCubit>()..getCart()),
        BlocProvider(create: (_) => sl<PaymentCubit>()),
        BlocProvider(create: (_) => sl<GetAddressesCubit>()),
      ],
      child: Scaffold(
        backgroundColor: ColorsHelper.black,
        appBar: AppBar(
          backgroundColor: Colors.black54,
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
          title: Text(
            "Cart",
            style: Styles.textStyle17.copyWith(color: ColorsHelper.white),
          ),
          // actions: [
          //   TextButton(
          //     onPressed: () {},
          //     child: Text(
          //       "Edit Items",
          //       style: Styles.textStyle14.copyWith(
          //         color: ColorsHelper.orange,
          //         decoration: TextDecoration.underline,
          //       ),
          //     ),
          //   ),
          // ],
        ),
        body: BlocBuilder<CartCubit, CartStates>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CartFailureState) {
              return Center(
                child: Text(
                  state.errorMessage,
                  style: Styles.textStyle14.copyWith(color: ColorsHelper.white),
                ),
              );
            } else if (state is CartSuccessState) {
              final cart = state.cartModel;
              if (cart.items.isEmpty) {
                return Center(
                  child: Text(
                    'Your cart is empty',
                    style: Styles.textStyle14.copyWith(
                      color: ColorsHelper.white,
                    ),
                  ),
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
                    price:
                        '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                    portion: item.quantity,
                    removeItemCart: () {
                      context.read<CartCubit>().deleteCartItem(item.id);
                    },
                    onTapAdd: () {
                      context.read<CartCubit>().updateCartItem(
                        itemId: item.id,
                        quantity: item.quantity + 1,
                      );
                    },
                    onTapRemove: () {
                      if (item.quantity > 1) {
                        context.read<CartCubit>().updateCartItem(
                          itemId: item.id,
                          quantity: item.quantity - 1,
                        );
                      }
                    },
                  );
                },
              );
            }
            return Center(
              child: Text(
                'No cart data available',
                style: Styles.textStyle14.copyWith(color: ColorsHelper.white),
              ),
            );
          },
        ),
        bottomNavigationBar: Builder(
          builder: (context) {
            final state = context.watch<CartCubit>().state;
            double total = 0.0;
            if (state is CartSuccessState) {
              total = state.cartModel.items.fold(0.0, (sum, item) {
                return sum + (item.price * item.quantity);
              });
            }

            return ContainerBottomNavigator(
              total: total,
              addressTitle: addressTitle,
            );
          },
        ),
      ),
    );
  }
}
