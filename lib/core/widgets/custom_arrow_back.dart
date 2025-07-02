import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18.sp,
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),);
  }
}