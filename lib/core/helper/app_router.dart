import 'package:go_router/go_router.dart';
import 'package:restaurant/features/auth/views/login_view.dart';
import 'package:restaurant/features/auth/views/register_view.dart';
import 'package:restaurant/features/chief_part/home/presentation/view/chif_home_view.dart';
import 'package:restaurant/features/forget_password.dart/presentation/views/forget_password_view.dart';
import 'package:restaurant/features/forget_password.dart/presentation/views/vertification_view.dart';
import 'package:restaurant/features/onboarding/views/onboarding_page.dart';
import 'package:restaurant/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: ChifHomeView.id,
        name: "welcome",
        builder: (context, state) => const ChifHomeView(),
      ),
      GoRoute(path:'/onBoardingView' ,
      builder: (context, state) => OnboardingPage(),

      ),
      GoRoute(path:'/login' ,
      builder: (context, state) => LoginView(),
      
      ),
       GoRoute(path:'/homeView' ,
      builder: (context, state) => LoginView(),
      
      ),
        GoRoute(path:'/forgetPassword' ,
      builder: (context, state) => ForgetPasswordView(),
      
      ),
      GoRoute(path: "/signUp" , 
      builder: (context, state) => SinUpView(),
      ),
        GoRoute(path: "/vertificationView" , 
      builder: (context, state) => VertificationView(),
      )
    ],
  );
}

