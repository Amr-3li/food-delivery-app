import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/add_remove_container.dart';
import 'package:sizer/sizer.dart';

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
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: Colors.black54.withValues(alpha: .7),
          borderRadius: BorderRadius.circular(12),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade200,
          //     blurRadius: 8,
          //     offset: Offset(0, 2),
          //   ),
          // ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: 20.w,
              height: 24.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageName,
                  fit: BoxFit.cover,
                ), //make it network
              ),
            ),

            SizedBox(width: 4.w),

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
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ColorsHelper.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle remove item
                        },
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.white,
                            ),
                            onPressed: removeItemCart,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 0.5.h),

                  // Text(
                  //   subTitle,
                  //   style: Styles.textStyle13.copyWith(
                  //     color: Colors.grey.shade600,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                  SizedBox(height: 2.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                          color: ColorsHelper.white,
                        ),
                      ),

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AddRemoveContainer(
                            onTap: onTapRemove,
                            text: "-",
                            containerColor: Colors.white.withValues(alpha: .3),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              "$portion",
                              style: Styles.textStyle16.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ColorsHelper.white,
                              ),
                            ),
                          ),

                          AddRemoveContainer(
                            onTap: onTapAdd,
                            text: "+",
                            containerColor: Colors.white.withValues(alpha: .3),
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
