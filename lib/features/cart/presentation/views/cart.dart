import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/features/cart/data/models/cart_model.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/back_icon_appbar.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/cart_item_container.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/edit_dialog.dart';
import 'package:sizer/sizer.dart';

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
    return Scaffold(
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
        padding: EdgeInsets.only(bottom: 80), // Prevent overlap with bottom bar
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Address",
                    style: Styles.textStyle16.copyWith(
                      color: ColorsHelper.lightPurple,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TextButton(
                    onPressed: () {
                      EditAddressDialog.showEditAddressDialog(
                        context,
                        title: addressTitle,
                        onSave: (addressTitle) {},
                        // final updatedAddress = address.copyWith(
                        //   title: title,

                        // );
                      );
                    },
                    child: Text(
                      "Edit",
                      style: Styles.textStyle16.copyWith(
                        color: ColorsHelper.orangeDark,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(3.h),
                height: 8.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorsHelper.lightBlue,
                ),

                child: Text("2118 Thornridge Cir. Syracuse"),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    'Total: \$120.00',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "breakdown",
                        style: Styles.textStyle14.copyWith(
                          color: ColorsHelper.orange,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (_)=>),);
                        },
                        icon: Icon(Icons.arrow_forward_ios_rounded),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              CustomElevatedButton(
                buttonText: 'Place Order',
                onPressedFunction: () {},
                buttonColor: ColorsHelper.orangeDark,
                widthButton: double.infinity,
                textColor: ColorsHelper.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
