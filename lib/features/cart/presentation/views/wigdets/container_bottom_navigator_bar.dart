import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/edit_dialog.dart';
import 'package:restaurant/features/payment/presentaion/cubit/payment_cubit.dart';
import 'package:restaurant/features/payment/presentaion/cubit/payment_state.dart';
import 'package:sizer/sizer.dart';

class ContainerBottomNavigator extends StatelessWidget {
  const ContainerBottomNavigator({
    super.key,
    required this.addressTitle,
    required this.total,
  });
  final String addressTitle;
  final double total;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'Total: \$$total',
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
                        //  context.pushNamed('');
                      },
                      icon: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 6.h),
            BlocConsumer<PaymentCubit, PaymentState>(
              listener: (context, state) {
                if (state is PaymentSucess) {
                  context.pushNamed('sucessPayment');
                  debugPrint('✅ Payment succeeded');
                } else if (state is PaymentFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                return CustomElevatedButton(
                  buttonText: 'Place Order',
                  onPressedFunction: () {
                    context.read<PaymentCubit>().makePayment(
                      courseId: "course123",
                      amount: 5000,
                      currency: "usd",
                    );
                  },
                  buttonColor: ColorsHelper.orangeDark,
                  widthButton: double.infinity,
                  textColor: ColorsHelper.white,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
