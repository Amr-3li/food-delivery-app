import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/styles.dart';

class SubTitleAllCategories extends StatelessWidget {
  const SubTitleAllCategories({super.key, required this.subTitle, this.onTap});
final String subTitle ;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subTitle,
          style: Styles.textStyle16,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: AppResponsive.width(context, value: 20),
          ),
          child: InkWell(
            onTap:onTap ,
            
            child: Text("See All >", style: Styles.textStyle16)),
        ),
      ],
    );
  }
}
