import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/search/data/search_cubit/search_cubit.dart';
import 'package:restaurant/features/search/data/search_cubit/search_states.dart';
import 'package:restaurant/features/search/data/search_repos/search_repo_implementation.dart';
import 'package:restaurant/features/search/presentation/widgets/restaurant_card.dart';
import '../widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Stack(
                        children: [
                          InkWell(
                            onTap: () => context.push(AppRouter.kCartView),
                            child: const Icon(Icons.shopping_bag_outlined, size: 28),
                          ),
                          const Positioned(
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.red,
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                   CustomSearchBar(cubit: BlocProvider.of<SearchCubit>(context),),
                  const SizedBox(height: 20),
                  BlocBuilder<SearchCubit , SearchStates>(builder: (context , state){
                    if (state is LoadingState){
                      return Center(child: CircularProgressIndicator());
                    }else if (state is FailureState){
                      return Center(child: Text(state.errorMessage));
                    }else if (state is SuccessSearch){
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.results.length,
                        shrinkWrap: true,
                        itemBuilder: (context , index){
                            return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ResturantCard(
                          name: state.results[index].dishName!,
                          rating: state.results[index].dishTotalRate.toString(),
                          url:state.results[index].dishImage!,
                        ),
                      );
                      });
                    }else {
                      return Text("Search to view reasult" , style: Styles.textStyle20,);
                    }
                  })
    
                  // if (searchResults.isEmpty)
                  //   const Text("No results found.")
                  // else
                  //   ...searchResults.map((restaurant) {
                      // return Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                      //   child: ResturantCard(
                      //     name: restaurant.dishName!,
                      //     rating: restaurant.dishTotalRate.toString(),
                      //     url: restaurant.dishImage!,
                      //   ),
                      // );
                  //   }).toList(),
                ],
              ),
            ),
         
      ),
    );
  }
}
