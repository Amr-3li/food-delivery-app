import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/features/home/presentation/cubit/category/category_cubit.dart';
import 'package:restaurant/features/home/presentation/views/widgets/category_details_view_body.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key, required this.state});

  final GoRouterState state;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {

  void check() {
    final cubit = BlocProvider.of<CategoryCubit>(context);
    cubit.resetDetails();

    Future.microtask(() {
      final extra = widget.state.extra;
      if (extra is int) {
        cubit.getCategoryDetails(id: extra);
      } else if (extra is String) {
        cubit.getMealsTypeDetails(mealType: extra);
      }
    });
  }


  @override
  void initState() {
    super.initState();
    check();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CategoryDetailsViewBody()),
    );
  }
}