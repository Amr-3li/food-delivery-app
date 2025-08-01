import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/add_remove_container.dart';
import 'package:sizer/sizer.dart';

import '../../../../home/presentation/views/widgets/custom_network_image.dart';

class CartItemContainer extends StatelessWidget {
  const CartItemContainer({
    super.key,
    required this.imageName,
    required this.title,
    // required this.subTitle,
    required this.price,
    this.onTapAdd,
    this.onTapRemove,
    required this.portion,
    required this.removeItemCart,
  });
  final String imageName;
  final String title;
  // final String subTitle;
  final String price;
  final void Function()? onTapAdd;
  final void Function()? onTapRemove;
  final void Function()? removeItemCart;
  final int portion;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.withAlpha(60),
          borderRadius: BorderRadius.circular(18),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade200,
          //     blurRadius: 8,
          //     offset: Offset(0, 2),
          //   ),
          // ],
        ),
        child: Row(
          children: [
            // Product Image
            CustomNetworkImage(
              imageUrl: imageName,
              height: 100,
              width: 100,
            ),

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
                      Expanded(
                        child: Text(
                          title,
                          style: Styles.textStyle16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.close, color: Colors.white,),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 18),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: Styles.textStyle18,
                      ),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AddRemoveContainer(
                            onTap: onTapRemove,
                            text: "-",
                            containerColor: Colors.white,
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              "$portion",
                              style: Styles.textStyle16,
                            ),
                          ),

                          AddRemoveContainer(
                            onTap: onTapAdd,
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
