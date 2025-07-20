import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:redacted/redacted.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/search/data/search_cubit/search_cubit.dart';
import 'package:restaurant/features/search/data/search_cubit/search_states.dart';
import 'package:restaurant/features/search/presentation/widgets/restaurant_card.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../core/helper/app_responsive.dart';
import '../../../../core/utils/color_helper.dart';
import '../../../../core/utils/icons.dart';
import '../../../home/presentation/views/widgets/custom_category_card.dart';
import '../widgets/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              radius: 22,
              backgroundColor: ColorsHelper.lightBabyBlue,
              child: SvgPicture.asset(AppIcons.iIcon),
            ),
          ),
        ),
        toolbarHeight: AppResponsive.height(context, value: 80),
        title: Text('Search', style: Styles.textStyle18),
      ),

      body: ListView(
        children: [
          CustomSearchBar(cubit: BlocProvider.of<SearchCubit>(context)),
          const SizedBox(height: 20),
          BlocBuilder<SearchCubit, SearchStates>(
            builder: (context, state) {
              if (state is LoadingState) {
                return GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(
                    8,
                    (index) => CustomCategory().redacted(
                      context: context,
                      redact: true,
                    ),
                  ),
                );
              } else if (state is FailureState) {
                return Center(child: Text(state.errorMessage));
              } else if (state is SuccessSearch) {
                return GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(
                    state.results.length,
                    (index) => CustomCategory(
                      imageUrl: state.results[index].dishImage,
                      name: state.results[index].chefName,
                      onTap: () {
                        // GoRouter.of(
                        //   context,
                        // ).push(AppRouter.kFoodDetailsScreenView, extra: state.results[index]);
                      },
                    ),
                  ),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
