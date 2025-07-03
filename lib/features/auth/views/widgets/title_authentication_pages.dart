import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';

class TitleAuthenticationPages extends StatelessWidget {
  const TitleAuthenticationPages({
    super.key, required this.title, required this.subTitle,
  });
final String title ;
final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [ Text(title , style: Styles.textStyle26),
        Text(subTitle , style: Styles.textStyle16.copyWith(color: ColorsHelper.grey),),],
    );
  }
}