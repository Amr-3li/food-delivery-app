import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/auth/data/models/user_model.dart';
import 'package:restaurant/features/chief_part/home/data/repository/chef_statistics/chef_statistics_repository_impl.dart';
import 'package:restaurant/features/chief_part/home/presentation/cubit/chef_statistics/chef_statistics_cubit.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/chif_home_body.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/custom_appbar.dart';
import 'package:restaurant/features/chief_part/widgets/custom_bottomnavigation_bar.dart';

class ChifHomeView extends StatefulWidget {
  const ChifHomeView({super.key, required this.chefModel});
  final UserModel chefModel;
  @override
  State<ChifHomeView> createState() => _ChifHomeViewState();
}

class _ChifHomeViewState extends State<ChifHomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChefStatisticsCubit(ChefStatisticsRepositoryImpl(ApiHelper()))
            ..fetchInitialData(), // Changed to fetchInitialData
      child: Scaffold(
        appBar: CustomAppBar(
          dynamicText: 'Erik Oberbrunner',
          onLeadingPressed: () {
            GoRouter.of(context).push(AppRouter.kMenuChiefView);
            debugPrint("Leading button pressed");
          },
          userImageUrl:
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
        ),
        body: const ChifHomeBody(),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: 0,
          context: context,
        ),
      ),
    );
  }
}
