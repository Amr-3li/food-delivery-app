import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/core/utils/app_toast.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_states.dart';

import '../../../data/models/restaurant_details_model.dart';

class CustomFoodItemCard extends StatelessWidget {
  const CustomFoodItemCard({super.key, required this.meals});

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CartCubit>(),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
          childAspectRatio: 0.85,
        ),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(meals[index].imageUrl ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meals[index].name ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          meals[index].category?.name ?? '',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$ ${meals[index].sizes[0].price ?? ''}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            BlocConsumer<CartCubit, CartStates>(
                              listener: (context, state) {
                                if (state is CartSuccessState) {
                                  AppToast.showSuccessToast(
                                    'Added to cart successfully',
                                  );
                                } else if (state is CartFailureState) {
                                  AppToast.showErrorToast(state.errorMessage);
                                }
                              },

                              builder: (context, state) {
                                return CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.orange,
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      if (meals[index].category?.id != null && meals[index].sizes.isNotEmpty) {
                                        final cartCubit = BlocProvider.of<CartCubit>(context);
                                        final dishId = meals[index].category?.id;
                                        final price = double.tryParse(meals[index].sizes[0].price);

                                        cartCubit.addToCart(
                                          dishId: dishId!,
                                          price: price!,
                                        );
                                      }
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
