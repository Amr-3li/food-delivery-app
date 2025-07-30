import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/search/presentation/views/widgets/search_bar.dart';
import 'package:restaurant/features/search/presentation/views/widgets/suggested_restaurants_list_view.dart';
import '../../../../../core/helper/app_router.dart';
import '../../../../home/presentation/views/widgets/custom_category_card.dart';
import '../../manger/search/search_cubit.dart';
import '../../manger/search/search_states.dart';
import 'custom_keyword_chip.dart';
import 'custom_popular_grid_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            CustomSearchBar(),
            const SizedBox(height: 20),
            Text('Recent Keywords', style: Styles.textStyle16),
            const SizedBox(height: 10),
            CustomKeywordChip(),
            const SizedBox(height: 20),
            BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                final cubit = context.watch<SearchCubit>();
                if (cubit.suggestedRestaurantsModel != null &&
                    cubit.popularFastFoodModel != null &&
                    (state is GetSuggestedRestaurantsSuccessState ||
                        state is GetPopularFoodSuccessState)) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Suggested Restaurants', style: Styles.textStyle16),
                      const SizedBox(height: 10),
                      SuggestedRestaurantsListView(
                        suggestedRestaurantsModel:
                            cubit.suggestedRestaurantsModel!,
                      ),
                      const SizedBox(height: 20),
                      Text('Popular Fast food', style: Styles.textStyle16),
                      const SizedBox(height: 10),
                      CustomPopularGridView(
                        popularFastFoodModel: cubit.popularFastFoodModel!,
                      ),
                    ],
                  );
                } else if (cubit.result != null &&
                    state is SearchSuccessState) {
                  return GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: .80,
                    children: List.generate(
                      cubit.result!.length,
                      (index) => CustomCategory(
                        name: cubit.result![index].dishName ?? '',
                        imageUrl: cubit.result![index].dishImage ?? '',
                        size: cubit.result![index].size,
                        price: cubit.result![index].dishPrice,
                        onTap: () {
                          GoRouter.of(context).push(
                            AppRouter.kFoodDetailsView,
                            extra: cubit.result![index].dishId,
                          );
                        },
                      ),
                    ),
                  );
                } else if (state is SearchErrorState) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppIcons.assetsNotFound, height: 50, width: 50,),
                        SizedBox(height: 10),
                        Text(
                          'Not Found',
                          style: Styles.textStyle16.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return LinearProgressIndicator(color: Colors.orange);
              },
            ),
          ],
        ),
      ),
    );
  }
}
