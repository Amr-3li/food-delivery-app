import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
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

import '../../../../core/utils/assets_data.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          GestureDetector(
            onTap: () async {
              if (context
                  .read<CartCubit>()
                  .cartModel!
                  .data!
                  .cart!
                  .items
                  .isNotEmpty) {
                final confirm = await showDialog<bool>(
                  context: context,
                  builder: (context) =>
                      AlertDialog(
                        title: Text("Clear Cart"),
                        content: Text(
                            "Are you sure you want to clear the cart? "),
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
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                AppIcons.assetsDelete,
                color: HexColor("F48D4C"),
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          if (cartCubit.cartModel != null) {
            final cart = cartCubit.cartModel!;
            if (cart.data!.cart!.items.isEmpty) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsData.assetsCartIsEmpty,
                      width: 150,
                      height: 150,
                    ),
                    SizedBox(height: 20),
                    Text('Your cart is empty', style: Styles.textStyle16),
                    SizedBox(height: 6),
                    Text(
                      'Add some items to your cart to proceed.',
                      style: Styles.textStyle14,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: CustomElevatedButton(
                        buttonText: 'Continue Shopping',
                        onPressedFunction: () {
                          GoRouter.of(
                            context,
                          ).go(AppRouter.kHomeUserView);
                        },
                        buttonColor: ColorsHelper.orange,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.only(bottom: 10.h),
              itemCount: cart.data!.cart!.items.length,
              itemBuilder: (context, index) {
                final item = cart.data!.cart!.items[index];
                return CartItemContainer(item: cart.data!.cart!.items[index]);
              },
            );
          } else if (state is CartFailureState) {
            return Center(
              child: Text(state.errorMessage, style: Styles.textStyle16),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
              strokeWidth: 2.0,
              strokeAlign: 3,
            ),
          );
        },
      ),
      bottomSheet: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          final cartCubit = context.read<CartCubit>();
          if (cartCubit.cartModel != null &&
              cartCubit.cartModel!.data!.cart!.items.isNotEmpty) {
            return ContainerBottomNavigator(
              total: cartCubit.cartModel!.data!.total ?? 0.0,
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
