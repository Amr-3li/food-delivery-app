import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/restaurant_view/widgets/filter_sheet.dart';
import 'package:restaurant/features/search/data/search_cubit/search_cubit.dart';
import 'package:restaurant/features/search/data/search_cubit/search_states.dart';
import 'package:restaurant/features/search/data/search_model/search_model.dart';
import 'package:restaurant/features/search/data/search_repos/search_repo_implementation.dart';
import '../widgets/food_item_card.dart';
import '../widgets/category_selector.dart';

/// Entry point with BlocProvider
class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit(SearchRepoImplementation()),
      child: const FoodScreenContent(),
    );
  }
}

/// Main screen content
class FoodScreenContent extends StatefulWidget {
  const FoodScreenContent({super.key});

  @override
  State<FoodScreenContent> createState() => _FoodScreenContentState();
}

class _FoodScreenContentState extends State<FoodScreenContent> {
  String selectedCategory = 'breakfast';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top bar with search and filter
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search foods...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                      ),
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          context.read<SearchCubit>().searchRequest(
                            search: value,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => FilterSheet(
                          onFilterApplied: (rate, price) {
                            context.read<SearchCubit>().filterRequest(
                              rate: rate,
                              price: price,
                            );
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.tune),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Category selector
              CategorySelector(
                selectedCategory: selectedCategory,
                onCategorySelected: (value) {
                  setState(() => selectedCategory = value);
                  // Trigger category-based filtering if needed
                },
              ),
              const SizedBox(height: 20),

              /// Results display
              Expanded(
                child: BlocBuilder<SearchCubit, SearchStates>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is FailureState) {
                      return Center(child: Text(state.errorMessage));
                    } else if (state is SuccessSearch) {
                      return _buildFoodGrid(state.results);
                    }
                    return const Center(
                      child: Text('Search for food or apply filters'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFoodGrid(List<SearchModel> items) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No food matches your selection.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return FoodItemCard(
          title: item.dishName ?? 'No name',
          subtitle: item.chefName ?? 'Unknown chef',
          price: item.dishPrice ?? '0',
          image: item.dishImage ?? '',
          onTap: () {
            // Handle item tap
          },
          onTapAdd: () {
            // Handle add to cart
          },
        );
      },
    );
  }
}
