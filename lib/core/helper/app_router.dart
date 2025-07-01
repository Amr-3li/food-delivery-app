import 'package:go_router/go_router.dart';
import 'package:restaurant/features/chief_part/home/presentation/view/chif_home_view.dart';

import '../../features/orders/presentation/views/my_orders_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const MyOrdersView(),
      ),
      GoRoute(
        path: ChifHomeView.id,
        name: "welcome",
        builder: (context, state) => const ChifHomeView(),
      ),
    ],
  );
}
