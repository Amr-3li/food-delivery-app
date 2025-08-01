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
    required this.total,
  });
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
        color: const Color.fromARGB(255, 196, 195, 195),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Address", style: Styles.textStyle16),
                  SizedBox(height: 2.h),
                  TextButton(
                    onPressed: () {
                      context.push(AppRouter.kAddresses);
                    },
                    child: Text(
                      GetAddressesCubit.get(context).addressesModel != null ? "Edit" : "Add",
                      style: Styles.textStyle16.copyWith(
                        color: ColorsHelper.orangeDark,
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<GetAddressesCubit, GetAddressesState>(
                builder: (context, state) {
                  final defaultAddress = context
                      .read<GetAddressesCubit>()
                      .addressesModel;

                  if (state is GetAddressesError) {
                    return Text(
                      "Error loading address",
                      style: TextStyle(color: Colors.red),
                    );
                  } else if (state is GetAddressesSuccess) {
                    if (defaultAddress == null) {
                      return Container(
                        padding: EdgeInsets.all(3.h),
                        height: 8.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorsHelper.grey.withAlpha(60),
                        ),
                        child: Center(child: Text("No default address set")),
                      );
                    } else {
                      return Container(
                        padding: EdgeInsets.all(3.h),
                        height: 8.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorsHelper.lightBlue,
                        ),
                        child: Text(defaultAddress.displayName ?? "Unnamed address"),
                      );
                    }
                  } else {
                    return SizedBox();
                  }
                },
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    'Total: \$${widget.total.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
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
                      if (widget.total > 0) {
                        context.read<PaymentCubit>().makePayment(
                          orderId: "1233",
                          amount:
                          widget.total.toInt() *
                              100, // Convert to cents for USD
                          currency: "usd",
                        );
                      }
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
      ),
    );
  }
}
