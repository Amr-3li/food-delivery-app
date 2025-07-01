import 'package:go_router/go_router.dart';
import 'package:restaurant/features/cart/presentation/views/cart.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';
import 'package:restaurant/features/chief_part/home/presentation/view/chif_home_view.dart';
import 'package:restaurant/features/orders/presentation/views/my_orders_view.dart';
import 'package:restaurant/features/reviews/presentation/views/reviews.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: AppRouteKeys.splash,
        builder: (context, state) => const ChifHomeView(),
      ),
      GoRoute(
        path: AppRouteKeys.home,
        builder: (context, state) => const ChifHomeView(),
      ),
      GoRoute(
        path: AppRouteKeys.chat,
        builder: (context, state) => const ChatScreen(userId: '1'),
      ),
      GoRoute(
        path: AppRouteKeys.order,
        builder: (context, state) => const MyOrdersView(),
      ),
      GoRoute(
        path: AppRouteKeys.cart,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: AppRouteKeys.review,
        builder: (context, state) => const ReviewScreen(),
      ),
    ],
  );
}

class AppRouteKeys {
  static const String splash = '/';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String order = '/order';
  static const String cart = '/cart';
  static const String review = '/review';
}
