import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/custom_appbar.dart';
import 'package:restaurant/features/chief_part/home/presentation/widget/populer_food.dart';
import 'package:sizer/sizer.dart';

class PopularFoodScreen extends StatelessWidget {
  const PopularFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        dynamicText: "Popular Term This Weeks",
        onLeadingPressed: () {
          GoRouter.of(context).push(AppRouter.kChifHome);
        },
        userImageUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPDheuafnrCB0q-VE5n3RLRREX5dN3JrdJzJF76tz0y80fP4uNM0ZTtXbXWA-e2yuWKKk&usqp=CAU",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(10),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),

              // Header Row
              // const Text(
              //   'Popular Term This Weeks',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),

              // const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        PopulerFood(
                          imageUrl:
                              'https://plus.unsplash.com/premium_photo-1669742928112-19364a33b530?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZGVsaWNpb3VzJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D',
                          onTap: () {},
                        ),
                        SizedBox(height: 5.h),
                      ],
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
}
