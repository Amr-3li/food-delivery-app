// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:restaurant/core/dependency_injection/service_locator.dart';
// import 'package:restaurant/features/chief_part/chief_menu/presentation/view/widget/review_screen_body.dart';
//
// import 'package:restaurant/features/reviews/data/repository/review_repository_implementation.dart';
// import 'package:restaurant/features/reviews/presentation/cubit/review_cubit.dart';
//
// class ReviewScreen extends StatefulWidget {
//   const ReviewScreen({super.key});
//
//   @override
//   State<ReviewScreen> createState() => _ReviewScreenState();
// }
//
// class _ReviewScreenState extends State<ReviewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) =>
//           ReviewsCubit(sl<ReviewsRepositoryImplementation>())..fetchReviews(),
//       child: ReviewScreenBody(),
//     );
//   }
// }
