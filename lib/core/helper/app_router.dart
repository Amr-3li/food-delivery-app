import 'package:go_router/go_router.dart';
import 'package:restaurant/features/cart/presentation/views/cart.dart';
import 'package:restaurant/features/chat/presentation/views/chat_screen.dart';
import 'package:restaurant/features/chief_part/add_new_item/presentation/views/add_new_items.dart';
import 'package:restaurant/features/chief_part/home/presentation/view/chif_home_view.dart';
import 'package:restaurant/features/chief_part/my_food_list/presentation/views/my_food_list_view.dart';
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
        path: AppRouteKeys.chifHome,
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
      GoRoute(
        path: AppRouteKeys.chifFoodList,
        builder: (context, state) => const MyFoodList(),
      ),
      GoRoute(
        path: AppRouteKeys.addNewItem,
        builder: (context, state) => const AddNewItems(),
      ),
    ],
  );
}

class AppRouteKeys {
  static const String splash = '/';
  static const String chifHome = '/chif_home';
  static const String chat = '/chat';
  static const String order = '/order';
  static const String cart = '/cart';
  static const String review = '/review';
  static const String chifFoodList = '/chif_food_list';
  static const String addNewItem = '/add_new_item';
}
