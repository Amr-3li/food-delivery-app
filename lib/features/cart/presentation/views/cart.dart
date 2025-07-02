import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:restaurant/core/dependency_injection/service_locator.dart';

import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';

import 'package:restaurant/features/cart/data/models/cart_model.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/back_icon_appbar.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/cart_item_container.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/container_bottom_navigator_bar.dart';

import 'package:restaurant/features/payment/data/repository/payment_repository.dart';
import 'package:restaurant/features/payment/presentaion/cubit/payment_cubit.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final List<CartItemModel> cartItem = [
    CartItemModel(
      id: 1,
      imageUrl:
          "https://img.favpng.com/11/24/25/pizza-european-cuisine-calzone-italian-cuisine-png-favpng-ki4NN2rw8FPaSbubr08vTwbRG_t.jpg",
      price: 60,
      title: "pizza calzone European",
    ),
    CartItemModel(
      id: 2,
      imageUrl:
          "https://img.favpng.com/11/24/25/pizza-european-cuisine-calzone-italian-cuisine-png-favpng-ki4NN2rw8FPaSbubr08vTwbRG_t.jpg",
      price: 32,
      title: "pizza calzone European",
    ),
  ];
  String addressTitle = "2118 Thornridge Cir. Syracuse";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(sl<PaymentRepository>()),
      child: Scaffold(
        backgroundColor: ColorsHelper.black,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          leading: BackIconAppBar(onTap: () {}),
          title: Text(
            "Cart",
            style: Styles.textStyle17.copyWith(color: ColorsHelper.white),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Edit Items",
                style: Styles.textStyle14.copyWith(
                  color: ColorsHelper.orange,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(
            bottom: 80,
          ), // Prevent overlap with bottom bar
          itemCount: cartItem.length,
          itemBuilder: (context, index) {
            return CartItemContainer(
              imageName: cartItem[index].imageUrl, //update image
              title: cartItem[index].title,
              price: '\$${cartItem[index].price}',
              portion: cartItem[index].quantity,
              removeItemCart: () {
                setState(() {
                  cartItem.removeAt(index);
                });
              },
              onTapAdd: () {
                setState(() {
                  cartItem[index].quantity++;
                });
              },
              onTapRemove: () {
                setState(() {
                  if (cartItem[index].quantity > 0) cartItem[index].quantity--;
                });
              },
            );
          },

          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),

        // Bottom area using bottomNavigationBar
        bottomNavigationBar: ContainerBottomNavigator(
          addressTitle: addressTitle,
        ),
      ),
    );
  }
}
