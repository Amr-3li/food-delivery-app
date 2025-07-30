import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
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
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
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
                      image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ6X5NG7cCI7MH2q3V-t9hwAFRl84NuZ_6Sw&s',
                      ),
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
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Added to cart!'),
                                    ),
                                  );
                                } else if (state is CartFailureState) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(state.errorMessage)),
                                  );
                                }
                              },

                              builder: (context, state) {
                                return CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.orange,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    onPressed: () {
                                      final cartCubit =
                                          BlocProvider.of<CartCubit>(context);
                                      final dishId = meals[index].category?.id;
                                      final price =
                                          ((meals[index].sizes[0].price
                                                      is String)
                                                  ? double.parse(
                                                      meals[index]
                                                          .sizes[0]
                                                          .price,
                                                    )
                                                  : (meals[index]
                                                                .sizes[0]
                                                                .price ??
                                                            0) *
                                                        1.0)
                                              .toInt();

                                      cartCubit.addToCart(
                                        dishId: dishId ?? 5,
                                        price: price,
                                      );
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
