import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../core/helper/app_responsive.dart';
import '../../../../core/utils/color_helper.dart';
import '../../../../core/utils/icons.dart';
import '../../data/repo/search_repo_implementation.dart';
import '../manger/search/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(SearchRepoImplementation())..getPopularFood()..getSuggestedRestaurants(),
      child: Scaffold(
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

        body: SearchViewBody(),
      ),
    );
  }
}



