import 'package:go_router/go_router.dart';

import 'package:restaurant/features/chief_part/home/presentation/view/chif_home_view.dart';

import 'package:restaurant/features/cart/presentation/views/cart.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';
import 'package:restaurant/features/chat/presentation/views/list_chat_screen.dart';

import 'package:restaurant/features/chief_part/add_new_item/presentation/views/add_new_items.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/views/my_food_list_view.dart';
import 'package:restaurant/features/reviews/presentation/views/reviews.dart';
import 'package:restaurant/features/auth/views/login_view.dart';
import 'package:restaurant/features/auth/views/register_view.dart';
import 'package:restaurant/features/forget_password/presentation/views/forget_password_view.dart';
import 'package:restaurant/features/forget_password/presentation/views/vertification_view.dart';
import 'package:restaurant/features/home_user/presentation/views/home_user_view.dart';
import 'package:restaurant/features/home_user/presentation/views/restaurant_view.dart';
import 'package:restaurant/features/onboarding/views/onboarding_page.dart';
import 'package:restaurant/features/notification/presentation/view/notification.dart';
import 'package:restaurant/features/payment/presentaion/view/payment_sucess.dart';

import 'package:restaurant/features/reviews/presentation/views/add_review.dart';

import '../../features/menu/presentation/views/add_new_address_view.dart';
import '../../features/menu/presentation/views/address_view.dart';


abstract class AppRouter {
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
  static const kHomeUserView = "/homeUserView";
  static const krestaurantView = "/restaurantView";
  static const kChifFoodList = '/chif_food_list';
  static const kAddNewItem = '/add_new_item';
  static const kChifHome = '/chif_home';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const AddNewAddressView(),
      ),
      GoRoute(
        path: kChifHome,
        builder: (context, state) => const ChifHomeView(),
      ),
      GoRoute(
        path: '/onBoardingView',
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(path: '/login', builder: (context, state) => LoginView()),
      GoRoute(
        path: '/forgetPassword',
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(path: "/signUp", builder: (context, state) => SinUpView()),
      GoRoute(
        path: "/vertificationView",
        builder: (context, state) => VertificationView(),
      ),
      GoRoute(
        path: kChatView,
        name: "chat",
        builder: (context, state) => const ChatScreen(userId: "1"),
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
      GoRoute(path: kHomeUserView, builder: (context, state) => HomeUserView()),
      GoRoute(
        path: krestaurantView,
        builder: (context, state) => RestaurantView(),
      ),
    ],
  );
}
