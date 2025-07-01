import 'package:flutter/material.dart';

import '../../../../../core/helper/app_responsive.dart';
import '../../../../../core/utils/color_helper.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class CustomOrderItem extends StatelessWidget {
  const CustomOrderItem({super.key, required this.isCompleted});

  final bool isCompleted;

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
              if (isCompleted)
              SizedBox(width: 18),
              if (isCompleted)
              Text(
                'Completed',
                style: Styles.textStyle16.copyWith(
                  color: ColorsHelper.green,
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
              Container(
                width: AppResponsive.width(context, value: 60),
                height: AppResponsive.height(context, value: 60),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Pizza Hut', style: Styles.textStyle16),
                        Spacer(),
                        Text('#162432', style: Styles.textStyle16),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text('\$20.00', style: Styles.textStyle14),
                        SizedBox(width: 8),
                        Text('|', style: Styles.textStyle14),
                        SizedBox(width: 8),
                        if (isCompleted)
                        Text('29 Jan, 12:30', style: Styles.textStyle14),
                        if (isCompleted)
                        SizedBox(width: 8),
                        Text('03 Items', style: Styles.textStyle14),
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
                  buttonText: isCompleted ? 'Rate' : 'Track Order',
                  onPressedFunction: () {},
                  buttonColor: isCompleted ? ColorsHelper.white : ColorsHelper.orange,
                  textColor: isCompleted ?  ColorsHelper.orange : ColorsHelper.white,
                ),
              ),
              SizedBox(
                width: AppResponsive.width(context, value: 140),
                height: AppResponsive.height(context, value: 40),
                child: CustomElevatedButton(
                  buttonText: isCompleted ? 'Re-Order' : 'Cancel',
                  onPressedFunction: () {},
                  buttonColor: isCompleted ? ColorsHelper.orange : ColorsHelper.white,
                  textColor: isCompleted ?  ColorsHelper.white : ColorsHelper.orange ,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
