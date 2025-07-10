import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/core/cache/cache_helper.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/core/widgets/custom_onboarding_button.dart';
import 'package:restaurant/features/onboarding/views/widgets/custom_onboardingwidget.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController controller = PageController();
  int index = 0;
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 70.2.h,
            child: PageView(
              onPageChanged: (value) {
                index = value;
                setState(() {
                  isLastPage = index == 3;
                });
              },
              controller: controller,
              children: [
                CustomOnboardingwidget(
                  imageUrl: 'https://www.foxrc.com/wp-content/uploads/2024/09/restaurants-concept-cdo-00.jpg',
                  title: ' Discover Endless Products',
                  description:
                      'Browse thousands of items in fashion, electronics, beauty, and more — all in one place. Your perfect purchase is just a tap away!',
                ),
                CustomOnboardingwidget(
                  imageUrl: 'https://www.foxrc.com/wp-content/uploads/2024/09/restaurants-concept-cdo-00.jpg',
                  title: 'Fast & Secure Delivery',
                  description:
                      'Get your orders delivered quickly and safely to your doorstep with real-time tracking and trusted delivery partners.',
                ),
                CustomOnboardingwidget(
                  imageUrl: 'https://www.foxrc.com/wp-content/uploads/2024/09/restaurants-concept-cdo-00.jpg',
                  title: 'Easy & Safe Payments',
                  description:
                      'Choose your preferred payment method and enjoy hassle-free checkout with our secure and encrypted payment system.',
                ),
                 CustomOnboardingwidget(
                  imageUrl: 'https://www.foxrc.com/wp-content/uploads/2024/09/restaurants-concept-cdo-00.jpg',
                  title: 'Fast & Secure Delivery',
                  description:
                      'Get your orders delivered quickly and safely to your doorstep with real-time tracking and trusted delivery partners.',
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            count: 4,
            
            effect: WormEffect(
            activeDotColor: ColorsHelper.orange ,
            dotColor: ColorsHelper.orangeGrey, 
            dotHeight: 10,
            dotWidth: 10,
            ),
         
          ),
          SizedBox(height: 10.h,),
          CustomMaterialButton(index: index, controller: controller , onPressed: ()async{  if (index < 3) {
                    controller.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.bounceIn,
                    );
                  } else {
                   context.go("/login");
               CacheHelper.saveData(key: "seeOnboarding", value: true);
                  }}, buttonName:isLastPage? "Get Started" :"Next",),
                  if(!isLastPage)
          TextButton(onPressed: ()async{
            context.go("/login");
                CacheHelper.saveData(key: "seeOnboarding", value: true);
          }, child: Text("Skip", style: Styles.textStyle16.copyWith(color: ColorsHelper.grey),))
        ],
      ),
    );
  }
}

