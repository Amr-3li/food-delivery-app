import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/features/auth/data/models/user_model.dart';
import 'package:restaurant/features/auth/views/vertification_view.dart';
import 'package:restaurant/features/chief_part/chat/presentation/views/chat_screen.dart';
import 'package:restaurant/features/chief_part/chat/presentation/views/list_chat_screen.dart';
import 'package:restaurant/features/chief_part/chief_menu/presentation/view/chief_menu.dart';
import 'package:restaurant/features/chief_part/chief_menu/presentation/view/withdraw.dart';
import 'package:restaurant/features/chief_part/food_details/presentation/views/chief_food_details_views.dart';
import 'package:restaurant/features/chief_part/home/presentation/view/chif_home_view.dart';
import 'package:restaurant/features/cart/presentation/views/cart.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';
import 'package:restaurant/features/chat/presentation/views/list_chat_screen.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/views/add_new_items.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/views/my_food_list_view.dart';
import 'package:restaurant/features/chief_part/notification/presentation/view/notification.dart';
import 'package:restaurant/features/chief_part/chief_menu/presentation/view/reviews.dart';
import 'package:restaurant/features/auth/views/login_view.dart';
import 'package:restaurant/features/auth/views/register_view.dart';
import 'package:restaurant/features/favorits/presentation/views/favorites_view.dart';
import 'package:restaurant/features/food_categories/presentation/views/food_categories_screen.dart';
import 'package:restaurant/features/food_details/presentation/views/food_details_screen.dart';
import 'package:restaurant/features/forget_password/presentation/confirem_password.dart';
import 'package:restaurant/features/forget_password/presentation/views/forget_password_view.dart';
import 'package:restaurant/features/forget_password/presentation/views/sent_otp.dart';
import 'package:restaurant/features/fqs/presentation/view/fqs.dart';
import 'package:restaurant/features/home_user/presentation/views/home_user_view.dart';
import 'package:restaurant/features/address/presentaion/view/address_view.dart';
import 'package:restaurant/features/internet/views/internet_view.dart';
import 'package:restaurant/features/menu/presentation/views/edit_profile_view.dart';
import 'package:restaurant/features/menu/presentation/views/menu_view.dart';
import 'package:restaurant/features/menu/presentation/views/personal_info_view.dart';
import 'package:restaurant/features/onboarding/views/onboarding_page.dart';
import 'package:restaurant/features/orders/presentation/views/my_orders_view.dart';
import 'package:restaurant/features/payment/presentaion/view/payment_sucess.dart';

import 'package:restaurant/features/restaurant_view/presentation/views/restaurant_view_screen.dart';
import 'package:restaurant/features/reviews/presentation/views/add_review.dart';
import 'package:restaurant/features/reviews/presentation/views/review_resturant.dart';
import 'package:restaurant/features/search/data/search_cubit/search_cubit.dart';
import 'package:restaurant/features/search/data/search_repos/search_repo_implementation.dart';
import 'package:restaurant/features/search/presentation/views/search_screen.dart';
import 'package:restaurant/features/splash/presentation/views/splash_view.dart';

import '../../features/address/presentaion/view/add_new_address_view.dart';
import '../../features/menu/data/repo/menu/menu_repo_implemation.dart';
import '../../features/menu/presentation/manger/menu/menu_cubit.dart';
import '../dependency_injection/service_locator.dart';
import '../network/network_info.dart';

abstract class AppRouter {
  static const kOnboardingView = '/OnboardingView';
  static const kSplashView = '/';
  static const kChatView = '/chat';
  static const kMessageListView = '/messageList';
  static const kReviewView = '/review';
  static const kAddReviewView = '/addReview';
  static const kWelcomeView = '/welcome';
  static const kHomeView = '/home';
  static const kProfileView = '/profile';
  static const kCartView = '/cart';
  static const kSucessPaymentView = '/sucessPayment';
  static const kNotificationView = '/notification';
  static const kNotificationChiefView = '/notificationChief';
  static const kHomeUserView = "/homeUserView";
  static const krestaurantView = "/restaurantView";
  static const kChifFoodList = '/chif_food_list';
  static const kAddNewItem = '/add_new_item';
  static const kChifHome = '/chif_home';
  static const kChatListView = "/chatListView";
  static const kChatChiefView = "/chatChiefView";
  static const kMenuChiefView = "/menuChiefView";
  static const kWithdrawView = "/withdrawChiefView";
  static const kPopularFoodView = "/popularFoodView";
  static const kPersonalInfoProfileView = "/personalInfoProfile";
  static const kEditProfileView = "/editProfile";
  static const kMenuProfileView = "/menuProfileView";
  static const kAllCategoryView = "/allCategoryView";
  static const kSearchScreenView = "/searchScreenView";
  static const kFoodScreenView = "/foodScreenView";
  static const kFoodDetailsScreenView = "/foodDetailsScreenView";
  static const kRestaurantViewVersion = "/restaurantViewVersion";
  static const String kOrder = '/order';
  static const String kAddresses = '/addresses';
  static const kFQS = '/fqs';
  static const kFavorite = "/favorite";
  static const kAddAddressView = "/addAddress";
  static const kChifFoodDetails = '/chif_food_details';
  static const String kResturantReview = '/resturantReview';
  static const String kLoginView = "/login";
  static const String kVerifyEmail = "/vertificationView";
  static const String kSendOtp = "/sendOtp";
  static const String kResetPassword = "/resetPassword";
  static const kMenuView = "/menuView";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kChifHome,
        builder: (context, state) {
           final chefModel = state.extra as UserModel;
         return ChifHomeView(chefModel: chefModel,);
        },
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
      GoRoute(
        path: '/forgetPassword',
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(path: "/signUp", builder: (context, state) => SinUpView()),
      GoRoute(
        path: kVerifyEmail,
        builder: (context, state) {
           final email = state.extra as String;
          return VertificationView(email: email,);},
        
      ),
        GoRoute(
        path: kSendOtp,
        builder: (context, state) {
           final email = state.extra as String;
          return SentOtp(email: email,);},
        
      ),
      GoRoute(
        path: kChatView,
        name: "chat",
        builder: (context, state) => const ChatScreen(),
      ),

     GoRoute(
        path: kChifFoodDetails,
        name: "chifFoodDetails",
        builder: (context, state) {
          final meal = state.extra as Meal;
          return FoodDetailsPage(meal: meal);
   },
),

      GoRoute(
        path: kAddNewItem,
        name: "addNewItem",
        builder: (context, state) => AddNewItems(),
      ),
      GoRoute(
        path: kChifFoodList,
        name: "chifFoodList",
        builder: (context, state) => MyFoodList(),
      ),
      GoRoute(
        path: kMessageListView,
        name: "messageList",
        builder: (context, state) => ChatListScreen(),
      ),
      GoRoute(
        path: kReviewView,
        name: "review",
        builder: (context, state) => ReviewScreen(),
      ),
      GoRoute(
        path: kAddReviewView,
        name: "addReview",
        builder: (context, state) => AddReview(),
      ),
      GoRoute(
        path: kCartView,
        name: "cart",
        builder: (context, state) => CartView(),
      ),

      GoRoute(
        path: kSucessPaymentView,
        name: "sucessPayment",
        builder: (context, state) => SucessPayment(),
      ),

      GoRoute(
        path: kNotificationView,
        name: "notification",
        builder: (context, state) => NotificationScreen(),
      ),
      GoRoute(
        path: kResturantReview,
        name: "resturantReview",
        builder: (context, state) => ReviewResturantScreen(),
      ),
      GoRoute(path: kHomeUserView, builder: (context, state) => HomeUserView()),
      // GoRoute(path: krestaurantView, builder: (context, state) => const RestaurantViewScreen()),
      GoRoute(path: kChatListView, builder: (context, state) => ChatListScreenChief()),
      GoRoute(path: kChatChiefView, builder: (context, state) => ChatScreenChief()),
      GoRoute(path: kMenuChiefView, builder: (context, state) => ChiefMenuScreen()),
      GoRoute(path: kWithdrawView, builder: (context, state) => WithdrawView()),
      // GoRoute(
      //   path: kPopularFoodView,
      //   builder: (context, state) => PopularFoodScreen(),
      // ),
      GoRoute(
        path: kPersonalInfoProfileView,
        builder: (context, state) => PersonalInfoView(),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => EditProfileView(),
      ),
      GoRoute(path: kMenuProfileView, builder: (context, state) => MenuView()),
      GoRoute(
        path: kSearchScreenView,
        builder: (context, state) => BlocProvider(
      create: (context) => SearchCubit(SearchRepoImplementation(), ),
      child: SearchScreen(),
      ),
      
      ),
      GoRoute(path: kFoodScreenView, builder: (context, state) => FoodScreen()),
      GoRoute(
        path: kFoodDetailsScreenView,
        builder: (context, state) {
          final int id = state.extra as int;
          return FoodDetailsScreen(foodId: id);
        },
      ),

      // GoRoute(
      //   path: kRestaurantViewVersion,
      //   builder: (context, state) =>
      //       const RestaurantViewScreen(),
      // ),
      GoRoute(path: kAddresses, builder: (_, __) => const AddressView()),
      GoRoute(path: kFQS, builder: (_, __) => const FAQsScreen()),
      GoRoute(path: kFavorite, builder: (_, __) => const FavoritesView()),
      GoRoute(path: kOrder, builder: (_, __) => const MyOrdersView()),
      GoRoute(
        path: kAddAddressView,
        builder: (context, state) => AddNewAddressView(),
      ),
      GoRoute(path: kResetPassword ,
      builder: (context , state){
        final email = state.extra as String;
        final otp = state.extra as String;
        return ConfiremPassword(email: email, otp: otp);
      }
      )
    ],
  );
}
