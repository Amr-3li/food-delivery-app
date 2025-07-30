import 'package:flutter/material.dart';
import 'package:restaurant/features/home/data/models/meal_details_model.dart';

import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';

class CustomCheckOutWidget extends StatefulWidget {
  const CustomCheckOutWidget({super.key, required this.sizeModel});

  final SizeModel sizeModel;

  @override
  State<CustomCheckOutWidget> createState() => _CustomCheckOutWidgetState();
}

class _CustomCheckOutWidgetState extends State<CustomCheckOutWidget> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppResponsive.height(context, value: 180),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(120),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$ ${widget.sizeModel.price ?? ''}', style: Styles.textStyle22),
                Container(
                  decoration: BoxDecoration(
                    color: ColorsHelper.blueBlack,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity --;
                            });
                          }
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: ColorsHelper.grey,
                          child: Text(
                            '-',
                            style: Styles.textStyle16.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        quantity.toString(),
                        style: Styles.textStyle18.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity ++;
                          });
                        },
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: ColorsHelper.grey,
                          child: Text(
                            '+',
                            style: Styles.textStyle14.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: AppResponsive.height(context, value: 65),
              decoration: BoxDecoration(
                color: ColorsHelper.orange,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'ADD TO CART',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}