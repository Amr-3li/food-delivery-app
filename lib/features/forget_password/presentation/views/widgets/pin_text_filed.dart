import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:sizer/sizer.dart';


class PinTextFiled extends StatelessWidget {
  const PinTextFiled({
    super.key, this.pinController,
  });
final TextEditingController? pinController;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: pinController,
       enableActiveFill: true,
       validator: (value) {
         if (value == null || value.length != 4) {
        return 'Please Enter The Code';
      }else{
        return null;
      }
       },
      keyboardType: TextInputType.number,
      appContext: context,
      length: 4,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
      selectedFillColor: ColorsHelper.buttongrey,
      inactiveFillColor: ColorsHelper.buttongrey,
        activeColor:ColorsHelper.buttongrey,
        selectedColor: ColorsHelper.buttongrey,
        inactiveColor: ColorsHelper.buttongrey,
        
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 7.6.h,
        fieldWidth: 16.5.w,
        borderWidth: 0,
        activeFillColor: ColorsHelper.buttongrey,
      ),
      
      animationDuration: Duration(milliseconds: 300),
      onCompleted: (pin) {},
    );
  }
}
