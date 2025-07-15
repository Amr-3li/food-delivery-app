import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/features/address/presentaion/manger/get_addresses/get_addresses_cubit.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_cubit.dart';

import 'package:restaurant/features/payment/presentaion/cubit/payment_cubit.dart';
import 'package:restaurant/features/payment/presentaion/cubit/payment_state.dart';
import 'package:sizer/sizer.dart';

class ContainerBottomNavigator extends StatefulWidget {
  const ContainerBottomNavigator({
    super.key,
    required this.addressTitle,
    required this.total,
  });
  final String addressTitle;
  final double total;

  @override
  State<ContainerBottomNavigator> createState() =>
      _ContainerBottomNavigatorState();
}

class _ContainerBottomNavigatorState extends State<ContainerBottomNavigator> {
  @override
  void initState() {
    context.read<GetAddressesCubit>().getDefaultAddressDetails();
    super.initState();
  }

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
                    context.push(AppRouter.kAddAddressView);
                    // EditAddressDialog.showEditAddressDialog(
                    //   context,
                    //   title: addressTitle,
                    //   onSave: (addressTitle) {},
                    //   // final updatedAddress = address.copyWith(
                    //   //   title: title,

                    //   // );
                    // );
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
            BlocBuilder<GetAddressesCubit, GetAddressesState>(
              builder: (context, state) {
                final addressList = context.read<GetAddressesCubit>().addresses;

                if (state is GetAddressesError) {
                  return Text(
                    "Error loading address",
                    style: TextStyle(color: Colors.red),
                  );
                } else if (state is GetAddressesSuccess) {
                  if (addressList == null) {
                    return Text("No address found");
                  } else if (addressList.isEmpty) {
                    return Container(
                      padding: EdgeInsets.all(3.h),
                      height: 8.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorsHelper.lightBlue,
                      ),
                      child: Center(child: Text("No default address set")),
                    );
                  } else {
                    final address = addressList.first;
                    return Container(
                      padding: EdgeInsets.all(3.h),
                      height: 8.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorsHelper.lightBlue,
                      ),
                      child: Text(address.displayName ?? "Unnamed address"),
                    );
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                Text(
                  'Total: \$${widget.total}',
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
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Clear Cart"),
                            content: Text(
                              "Are you sure you want to clear the cart?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text("Yes"),
                              ),
                            ],
                          ),
                        );
                        if (confirm == true) {
                          // ignore: use_build_context_synchronously
                          context.read<CartCubit>().clearCart();
                        }
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
                  buttonText: widget.total == 0 ? "Cart Empty" : 'Place Order',
                  onPressedFunction: widget.total == 0
                      ? () {
                          context.push(AppRouter.kFoodScreenView);
                        }
                      : () {
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
