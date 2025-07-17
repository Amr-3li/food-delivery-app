import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/features/restaurant_view/data/restaurant_view_repository.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/cubit/restaurant_view_cubit.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/cubit/restaurant_view_state.dart';
import 'package:restaurant/features/restaurant_view/data/restaurant_view_model.dart';

class RestaurantViewScreen extends StatefulWidget {
  const RestaurantViewScreen({super.key, required this.id});
  final int id;
  @override
  State<RestaurantViewScreen> createState() => _RestaurantViewScreenState();
}

class _RestaurantViewScreenState extends State<RestaurantViewScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RestaurantViewCubit(sl<RestaurantViewRepository>())
            ..getRestaurantView(widget.id),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<RestaurantViewCubit, RestaurantViewState>(
            builder: (context, state) {
              if (state is RestaurantViewLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RestaurantViewLoaded) {
                final data = state.restaurantView;
                final restaurant = data.restaurant;
                final categories = data.categories;

                selectedCategory ??= state.selectedCategory;

                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 200,
                      pinned: true,
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () {},
                        ),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text(restaurant.name ?? "Restaurant"),
                        background: Image.network(
                          "https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg",
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              Container(color: Colors.grey[200]),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          Text(
                            restaurant.description ??
                                "No description available.",
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              const Icon(Icons.delivery_dining, size: 20),
                              const SizedBox(width: 4),
                              const Text("Free"),
                              const SizedBox(width: 12),
                              const Icon(Icons.timer, size: 20),
                              const SizedBox(width: 4),
                              const Text("20 min"),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 50,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 8),
                              itemBuilder: (context, index) {
                                final category = categories[index];
                                return ChoiceChip(
                                  label: Text(category.name),
                                  selected: selectedCategory?.id == category.id,
                                  onSelected: (selected) {
                                    setState(() {
                                      selectedCategory = category;
                                    });
                                    context
                                        .read<RestaurantViewCubit>()
                                        .selectCategory(category);
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "${selectedCategory?.name} (${selectedCategory?.meals.length ?? 0})",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: selectedCategory?.meals.length ?? 0,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 16),
                            itemBuilder: (context, index) {
                              final meal = selectedCategory!.meals[index];
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          meal.image,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                          errorBuilder: (_, __, ___) =>
                                              Container(
                                                width: 80,
                                                height: 80,
                                                color: Colors.grey[200],
                                              ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              meal.name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              meal.description,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.orange,
                                                  size: 16,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  "${meal.rating.toStringAsFixed(1)}",
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  "\$${meal.sizes.first.price.toStringAsFixed(2)}",
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              } else if (state is RestaurantViewError) {
                return Center(child: Text("Error: ${state.message}"));
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
