import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_elevated_button.dart';
import 'package:restaurant/features/address/presentaion/manger/get_addresses/get_addresses_cubit.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_cubit.dart';

import 'package:restaurant/features/payment/presentaion/cubit/payment_cubit.dart';
import 'package:restaurant/features/payment/presentaion/cubit/payment_state.dart';
import 'package:sizer/sizer.dart';

class ContainerBottomNavigator extends StatefulWidget {
  const ContainerBottomNavigator({super.key, required this.total});

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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        color: const Color.fromARGB(255, 196, 195, 195),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Address", style: Styles.textStyle16),
              TextButton(
                onPressed: () {
                  context.push(AppRouter.kAddresses);
                },
                child: Text(
                  GetAddressesCubit.get(context).addressesModel?.displayName?.isNotEmpty ?? true ? "Edit" : "Add",
                  style: Styles.textStyle16.copyWith(
                    color: ColorsHelper.orangeDark,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          BlocBuilder<GetAddressesCubit, GetAddressesState>(
            builder: (context, state) {
              final defaultAddress = GetAddressesCubit.get(context).addressesModel;

              if (defaultAddress != null) {
                return Center(
                  child: Text(defaultAddress.displayName ?? ''),
                );
              } else if (state is GetAddressesError) {
                return Center(
                  child: Text(state.error, style: Styles.textStyle16.copyWith(color: Colors.red),),
                );
              }

              return SizedBox();
            },
          ),
          SizedBox(height: 20),
          Text(
            'Total: \$ ${widget.total.toStringAsFixed(2)}',
            style: Styles.textStyle18,
          ),
          SizedBox(height: 20),
          BlocListener<PaymentCubit, PaymentState>(
            listener: (context, state) {
              if (state is CreateOrder) {
                context.read<CartCubit>().getCart();
                GoRouter.of(context).pushReplacement(AppRouter.kSucessPaymentView);
              } else if (state is PaymentFailure) {
                context.pop();
              }
            },
            child: CustomElevatedButton(
              buttonText: 'Place Order',
              onPressedFunction: () {
                double price = widget.total;

                int dollars = price.floor();
                int cents = ((price - dollars) * 100).round();
                int totalCents = (dollars * 100) + cents;

                context.read<PaymentCubit>().makePayment(
                  amount: totalCents, currency: "usd",
                );
              },
              buttonColor: ColorsHelper.orangeDark,
              widthButton: double.infinity,
              textColor: ColorsHelper.white,
            ),
          ),
        ],
      ),
    );
  }
}
