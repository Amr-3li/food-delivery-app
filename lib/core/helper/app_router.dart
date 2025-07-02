import 'package:go_router/go_router.dart';
import 'package:restaurant/features/cart/presentation/views/cart.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';
import 'package:restaurant/features/chat/presentation/views/list_chat_screen.dart';
import 'package:restaurant/features/chief_part/home/presentation/view/chif_home_view.dart';

import 'package:restaurant/features/payment/presentaion/view/payment_sucess.dart';

import 'package:restaurant/features/menu/presentation/views/menu_view.dart';

import 'package:restaurant/features/reviews/presentation/views/add_review.dart';
import 'package:restaurant/features/reviews/presentation/views/reviews.dart';

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

  static final router = GoRouter(
    routes: [
      GoRoute(path: kSplashView, builder: (context, state) => const MenuView()),
      GoRoute(
        path: ChifHomeView.id,
        name: "welcome",
        builder: (context, state) => const ChifHomeView(),
      ),
      GoRoute(
        path: ChifHomeView.id,
        name: "Home",
        builder: (context, state) => const ChifHomeView(),
      ),
      GoRoute(
        path: kChatView,
        name: "chat",
        builder: (context, state) => const ChatScreen(userId: "1"),
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
    ],
  );
}
