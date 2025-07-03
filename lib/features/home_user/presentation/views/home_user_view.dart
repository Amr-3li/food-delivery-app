import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/tex_form.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/circle_icon.dart';
import 'package:restaurant/features/home_user/presentation/views/widgets/dropdown_button.dart';

class HomeUserView extends StatelessWidget {
  const HomeUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
body: SafeArea(child:Padding(
  padding:  EdgeInsets.only(top: AppResponsive.height(context, value: 30) , left:  AppResponsive.width(context, value: 18)),
  child: Column(
    children: [
      Padding(
        padding:  EdgeInsets.only(right: AppResponsive.width(context, value: 20)),
        child: CustomAppBar(),
        
      ) ,
      SizedBox(height: AppResponsive.height(context, value: 10),),
      Row(
        children: [
          Text("Hey Hala," , style: Styles.textStyle16.copyWith(fontWeight: FontWeight.normal),),
          Text("Good Afternoon," , style: Styles.textStyle16,),
        ],
      ),
      // CustomTextField(textLabel: "Search", textController: textController, textFieldSuffix: textFieldSuffix, validatorFunction: validatorFunction)

    ],
  
  ),
) ,

),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleIcone(icon: Assets.assetsImagesMenu, backgroundColor: ColorsHelper.buttongrey,),
           SizedBox(width: AppResponsive.width(context, value: 10),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("DELIVERY TO" , style: Styles.textStyle12.copyWith(color: ColorsHelper.orange),),
           SizedBox(
            height: AppResponsive.height(context, value: 17),
            width: AppResponsive.width(context, value: 107),
            child: CustomDropdownButton()),
          
          ],
        ),
          ],
        ),
       
    
          CircleIcone(icon: Assets.assetsCart, backgroundColor: Colors.black , iconColor: Colors.white,)
      ],
    );
  }
}

