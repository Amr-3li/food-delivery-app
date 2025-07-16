import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/features/auth/data/models/user_model.dart';
import 'package:restaurant/features/auth/views/login_view.dart';
import 'package:restaurant/features/auth/views/register_view.dart';
import 'package:restaurant/features/auth/views/vertification_view.dart';
import 'package:restaurant/features/cart/presentation/views/cart.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';
import 'package:restaurant/features/chat/presentation/views/list_chat_screen.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/views/add_new_items.dart';
import 'package:restaurant/features/chief_part/chat/presentation/views/chat_screen.dart'
    as ChiefChatScreen;
import 'package:restaurant/features/chief_part/chat/presentation/views/list_chat_screen.dart'
    as ChiefChatList;
import 'package:restaurant/features/chief_part/chief_menu/presentation/view/chief_menu.dart';
import 'package:restaurant/features/chief_part/chief_menu/presentation/view/reviews.dart';
import 'package:restaurant/features/chief_part/chief_menu/presentation/view/withdraw.dart';
import 'package:restaurant/features/chief_part/food_details/presentation/views/chief_food_details_views.dart';
import 'package:restaurant/features/chief_part/home/presentation/view/chif_home_view.dart';
import 'package:restaurant/features/chief_part/home/presentation/view/popular_term_screen.dart';
import 'package:restaurant/features/chief_part/my_food_list/data/models/food_list_model.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/views/my_food_list_view.dart';
import 'package:restaurant/features/chief_part/notification/presentation/view/notification.dart';
import 'package:restaurant/features/favorits/presentation/views/favorites_view.dart';
import 'package:restaurant/features/food_categories/presentation/views/food_categories_screen.dart';
import 'package:restaurant/features/food_details/presentation/views/food_details_screen.dart';
import 'package:restaurant/features/forget_password/presentation/confirem_password.dart';
import 'package:restaurant/features/forget_password/presentation/views/forget_password_view.dart';
import 'package:restaurant/features/forget_password/presentation/views/sent_otp.dart';
import 'package:restaurant/features/fqs/presentation/view/fqs.dart';
import 'package:restaurant/features/home_user/presentation/views/home_user_view.dart';
import 'package:restaurant/features/internet/views/internet_view.dart';
import 'package:restaurant/features/menu/data/repo/menu/menu_repo_implemation.dart';
import 'package:restaurant/features/menu/presentation/manger/menu/menu_cubit.dart';
import 'package:restaurant/features/menu/presentation/views/edit_profile_view.dart';
import 'package:restaurant/features/menu/presentation/views/menu_view.dart';
import 'package:restaurant/features/menu/presentation/views/personal_info_view.dart';
import 'package:restaurant/features/onboarding/views/onboarding_page.dart';
import 'package:restaurant/features/orders/presentation/views/my_orders_view.dart';
import 'package:restaurant/features/payment/presentaion/view/payment_sucess.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/all_resturant_screen.dart';
import 'package:restaurant/features/restaurant_view/presentation/views/restaurant_view_screen.dart';
import 'package:restaurant/features/reviews/presentation/views/add_review.dart';
import 'package:restaurant/features/reviews/presentation/views/review_resturant.dart';
import 'package:restaurant/features/search/presentation/views/search_screen.dart';
import 'package:restaurant/features/splash/presentation/views/splash_view.dart';
import 'package:restaurant/features/address/presentaion/view/address_view.dart';
import 'package:restaurant/features/address/presentaion/view/add_new_address_view.dart';

import '../dependency_injection/service_locator.dart';
import '../network/network_info.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kLoginView = '/login';
  static const kOnboardingView = '/onboarding';
  static const kHomeUserView = '/homeUserView';
  static const kChatView = '/chat';
  static const kMessageListView = '/messageList';
  static const kReviewView = '/review';
  static const kAddReviewView = '/addReview';
  static const kCartView = '/cart';
  static const kSucessPaymentView = '/sucessPayment';
  static const kNotificationView = '/notification';
  static const kNotificationChiefView = '/notificationChief';
  static const krestaurantView = "/restaurantView";
  static const kAllRestaurantsView = "/restaurantView";
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
  static const kSearchScreenView = "/searchScreenView";
  static const kFoodScreenView = "/foodScreenView";
  static const kFoodDetailsScreenView = "/foodDetailsScreenView";
  static const kOrder = '/order';
  static const kAddresses = '/addresses';
  static const kFQS = '/fqs';
  static const kFavorite = "/favorite";
  static const kAddAddressView = "/addAddress";
  static const kChifFoodDetails = '/chif_food_details';
  static const kResturantReview = '/resturantReview';
  static const kVerifyEmail = "/vertificationView";
  static const kSendOtp = "/sendOtp";
  static const kResetPassword = "/resetPassword";

  static final router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ValueListenableBuilder<bool>(
            valueListenable: sl<NetworkInfo>().isConnected,
            builder: (context, isConnected, _) {
              return isConnected ? child : const InternetView();
            },
          );
        },
        routes: [
          GoRoute(path: kSplashView, builder: (_, __) => const SplashView()),
          GoRoute(path: kLoginView, builder: (_, __) => LoginView()),
          GoRoute(path: kOnboardingView, builder: (_, __) => OnboardingPage()),
          GoRoute(path: '/signUp', builder: (_, __) => SinUpView()),
          GoRoute(
            path: '/forgetPassword',
            builder: (_, __) => ForgetPasswordView(),
          ),
          GoRoute(
            path: kSendOtp,
            builder: (context, state) {
              final email = state.extra as String;
              return SentOtp(email: email);
            },
          ),
          GoRoute(
            path: kResetPassword,
            builder: (context, state) {
              final map = state.extra as Map<String, dynamic>;
              return ConfiremPassword(email: map['email'], otp: map['otp']);
            },
          ),
          GoRoute(
            path: kVerifyEmail,
            builder: (context, state) {
              final email = state.extra as String;
              return VertificationView(email: email);
            },
          ),
          GoRoute(path: kChatView, builder: (_, __) => const ChatScreen()),
          GoRoute(path: kMessageListView, builder: (_, __) => ChatListScreen()),
          GoRoute(path: kReviewView, builder: (_, __) => ReviewScreen()),
          GoRoute(path: kAddReviewView, builder: (_, __) => AddReview()),
          GoRoute(path: kCartView, builder: (_, __) => CartView()),
          GoRoute(
            path: kSucessPaymentView,
            builder: (_, __) => SucessPayment(),
          ),
          GoRoute(
            path: kNotificationView,
            builder: (_, __) => NotificationScreen(),
          ),
          GoRoute(path: kHomeUserView, builder: (_, __) => HomeUserView()),
          GoRoute(
            path: krestaurantView,
            builder: (_, state) {
              final int id = state.extra as int;
              return RestaurantViewScreen(id: id);
            },
          ),
          GoRoute(
            path: kAllRestaurantsView,
            builder: (_, __) => const AllRestaurantsScreen(),
          ),
          GoRoute(path: kChifFoodList, builder: (_, __) => MyFoodList()),
          GoRoute(path: kAddNewItem, builder: (_, __) => AddNewItems()),
          GoRoute(
            path: kChifHome,
            builder: (_, state) {
              final chef = state.extra as UserModel;
              return ChifHomeView(chefModel: chef);
            },
          ),
          GoRoute(
            path: kChatListView,
            builder: (_, __) => ChiefChatList.ChatListScreenChief(),
          ),
          GoRoute(
            path: kChatChiefView,
            builder: (_, __) => ChiefChatScreen.ChatScreenChief(),
          ),
          GoRoute(path: kMenuChiefView, builder: (_, __) => ChiefMenuScreen()),
          GoRoute(path: kWithdrawView, builder: (_, __) => WithdrawView()),
          GoRoute(
            path: kPopularFoodView,
            builder: (_, __) => PopularFoodScreen(),
          ),
          GoRoute(
            path: kPersonalInfoProfileView,
            builder: (_, __) => PersonalInfoView(),
          ),
          GoRoute(
            path: kEditProfileView,
            builder: (_, __) => EditProfileView(),
          ),
          GoRoute(path: kMenuProfileView, builder: (_, __) => MenuView()),
          GoRoute(path: kSearchScreenView, builder: (_, __) => SearchScreen()),
          GoRoute(path: kFoodScreenView, builder: (_, __) => FoodScreen()),
          GoRoute(
            path: kFoodDetailsScreenView,
            builder: (_, state) {
              final int id = state.extra as int;
              return FoodDetailsScreen(foodId: id);
            },
          ),
          GoRoute(path: kAddresses, builder: (_, __) => const AddressView()),
          GoRoute(
            path: kAddAddressView,
            builder: (_, __) => AddNewAddressView(),
          ),
          GoRoute(path: kFQS, builder: (_, __) => const FAQsScreen()),
          GoRoute(path: kFavorite, builder: (_, __) => const FavoritesView()),
          GoRoute(path: kOrder, builder: (_, __) => const MyOrdersView()),
          GoRoute(
            path: kResturantReview,
            builder: (_, __) => ReviewResturantScreen(),
          ),
          GoRoute(
            path: kChifFoodDetails,
            builder: (_, state) {
              final meal = state.extra as Meal;
              return FoodDetailsPage(meal: meal);
            },
          ),
        ],
      ),
    ],
  );
}
