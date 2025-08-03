import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:restaurant/features/address/data/model/address_model.dart';
import 'package:restaurant/features/address/data/repo/add_address/add_address_repo_implemation.dart';
import 'package:restaurant/features/address/presentaion/manger/add_address/add_address_cubit.dart';
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
import 'package:restaurant/features/forget_password/presentation/confirem_password.dart';
import 'package:restaurant/features/forget_password/presentation/views/forget_password_view.dart';
import 'package:restaurant/features/forget_password/presentation/views/sent_otp.dart';
import 'package:restaurant/features/address/presentaion/view/address_view.dart';
import 'package:restaurant/features/home/data/models/meal_details_model.dart';
import 'package:restaurant/features/home/presentation/views/all_categories_view.dart';
import 'package:restaurant/features/home/presentation/views/all_restaurants_view.dart';
import 'package:restaurant/features/home/presentation/views/category_details_view.dart';
import 'package:restaurant/features/home/presentation/views/chef_details_view.dart';
import 'package:restaurant/features/home/presentation/views/restaurant_details_view.dart';
import 'package:restaurant/features/internet/views/internet_view.dart';
import 'package:restaurant/features/menu/presentation/views/edit_profile_view.dart';
import 'package:restaurant/features/menu/presentation/views/menu_view.dart';
import 'package:restaurant/features/menu/presentation/views/personal_info_view.dart';
import 'package:restaurant/features/onboarding/views/onboarding_page.dart';
import 'package:restaurant/features/orders/presentation/manger/my_orders_cubit.dart';
import 'package:restaurant/features/orders/presentation/views/my_orders_view.dart';
import 'package:restaurant/features/payment/presentaion/view/payment_sucess.dart';
import 'package:restaurant/features/reviews/presentation/views/add_review.dart';
import 'package:restaurant/features/reviews/presentation/views/review_resturant.dart';
import 'package:restaurant/features/splash/presentation/views/splash_view.dart';

import '../../features/address/presentaion/view/add_new_address_view.dart';
import '../../features/home/presentation/cubit/category/category_cubit.dart';
import '../../features/home/presentation/cubit/resturant/resturant_cubit.dart';
import '../../features/home/presentation/views/food_details_view.dart';
import '../../features/home/presentation/views/home_user_view.dart';
import '../../features/menu/data/repo/menu/menu_repo_implemation.dart';
import '../../features/menu/presentation/manger/menu/menu_cubit.dart';
import '../../features/menu/presentation/views/faqs_view.dart';
import '../../features/orders/data/repo/my_orders_repo_implemation.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../dependency_injection/service_locator.dart';
import '../network/network_info.dart';

abstract class AppRouter {
  static const String kSplashView = '/';
  static const String kOnboardingView = '/OnboardingView';
  static const String kLoginView = "/login";
  static const String kSingUp = "/signUp";
  static const String kHomeUserView = "/homeUserView";
  static const String kFoodDetailsView = "/foodDetailsView";
  static const String kChefDetailsView = "/ChefDetailsView";
  static const String kChatView = '/chat';
  static const String kMessageListView = '/messageList';
  static const String kReviewView = '/review';
  static const String kAddReviewView = '/addReview';
  static const String kCartView = '/cart';
  static const String kSucessPaymentView = '/sucessPayment';
  static const String kNotificationView = '/notification';
  static const String kChifFoodList = '/chif_food_list';
  static const String kAddNewItem = '/add_new_item';
  static const String kChifHome = '/chif_home';
  static const String kChatListView = "/chatListView";
  static const String kChatChiefView = "/chatChiefView";
  static const String kMenuChiefView = "/menuChiefView";
  static const String kWithdrawView = "/withdrawChiefView";
  static const String kPersonalInfoProfileView = "/personalInfoProfile";
  static const String kEditProfileView = "/editProfile";
  static const String kAllCategoryView = "/allCategoryView";
  static const String kSearchScreenView = "/searchScreenView";
  static const String kAllRestaurantsView = "/AllRestaurantsView";
  static const String kRestaurantDetailsView = "/RestaurantDetailsView";
  static const String kOrder = '/order';
  static const String kAddresses = '/addresses';
  static const String kFQS = '/fqs';
  static const String kFavorite = "/favorite";
  static const String kAddAddressView = "/addAddress";
  static const String kChifFoodDetails = '/chif_food_details';
  static const String kResturantReview = '/resturantReview';
  static const String kVerifyEmail = "/vertificationView";
  static const String kSendOtp = "/sendOtp";
  static const String kResetPassword = "/resetPassword";
  static const String kMenuView = "/menuView";
  static const String kCategoryDetailsView = "/CategoryDetailsView";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => OnboardingPage(),
      ),

      ShellRoute(
        builder: (context, state, child) {
          return ValueListenableBuilder<bool>(
            valueListenable: sl<NetworkInfo>().isConnected,
            builder: (context, isConnected, _) {
              if (!isConnected) {
                return const InternetView();
              }
              return child;
            },
          );
        },
        routes: [
          GoRoute(path: kLoginView, builder: (context, state) => LoginView()),

          GoRoute(path: kSingUp, builder: (context, state) => SinUpView()),

          GoRoute(
            path: '/forgetPassword',
            builder: (context, state) => ForgetPasswordView(),
          ),

          GoRoute(
            path: kVerifyEmail,
            builder: (context, state) {
              final email = state.extra as String;
              return VertificationView(email: email);
            },
          ),

          GoRoute(
            path: kSendOtp,
            builder: (context, state) {
              final email = state.extra as String;
              return SentOtp(email: email);
            },
          ),

          // Home View and cubit
          ShellRoute(
            builder: (context, state, child) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => sl<CategoryCubit>()..fetchCategories(),
                  ),
                  BlocProvider(
                    create: (_) => RestaurantCubit(sl())..getRestaurants(),
                  ),
                ],
                child: child,
              );
            },
            routes: [
              GoRoute(
                path: kHomeUserView,
                builder: (context, state) => HomeUserView(),
              ),

              GoRoute(
                path: kAllCategoryView,
                builder: (context, state) => AllCategoriesView(),
              ),

              GoRoute(
                path: kCategoryDetailsView,
                builder: (context, state) => CategoryDetailsView(state: state),
              ),

              GoRoute(
                path: kAllRestaurantsView,
                builder: (context, state) => const AllRestaurantsView(),
              ),

              GoRoute(
                path: kRestaurantDetailsView,
                builder: (context, state) {
                  final int id = state.extra as int;
                  return RestaurantDetailsView(id: id);
                },
              ),
            ],
          ),

          GoRoute(
            path: kFoodDetailsView,
            builder: (context, state) {
              final int id = state.extra as int;
              return FoodDetailsView(id: id);
            },
          ),

          GoRoute(
            path: kChefDetailsView,
            builder: (context, state) {
              final ChefModel chefModel = state.extra as ChefModel;
              return ChefDetailsView(chefModel: chefModel);
            },
          ),

          GoRoute(
            path: kChifHome,
            builder: (context, state) {
              final chefModel = state.extra as UserModel;
              return ChifHomeView(chefModel: chefModel);
            },
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

          GoRoute(
            path: kChatListView,
            builder: (context, state) => ChatListScreenChief(),
          ),
          GoRoute(
            path: kChatChiefView,
            builder: (context, state) => ChatScreenChief(),
          ),
          GoRoute(
            path: kMenuChiefView,
            builder: (context, state) => ChiefMenuScreen(),
          ),
          GoRoute(
            path: kWithdrawView,
            builder: (context, state) => WithdrawView(),
          ),

          GoRoute(
            path: kSearchScreenView,
            builder: (context, state) => SearchView(),
          ),

          GoRoute(path: kAddresses, builder: (_, __) => const AddressView()),

          GoRoute(path: kFQS, builder: (_, __) => const FaqsView()),

          GoRoute(path: kFavorite, builder: (_, __) => const FavoritesView()),

          GoRoute(
            path: kOrder,
            builder: (context, state) => BlocProvider(
              create: (context) =>
                  MyOrdersCubit(MyOrdersRepoImplementation())
                    ..getMyOrders(status: 'pending'),
              child: MyOrdersView(),
            ),
          ),

          GoRoute(
            path: kAddAddressView,
            builder: (context, state) => BlocProvider(
              create: (context) => AddAddressCubit(AddAddressRepoImplementation())..getCurrentLocation(),
              child: AddNewAddressView(
                addressesModel: state.extra != null ? state.extra as AddressesModel : AddressesModel(),
              ),
            ),
          ),

          GoRoute(
            path: kResetPassword,
            builder: (context, state) {
              final email = state.extra as String;
              final otp = state.extra as String;
              return ConfiremPassword(email: email, otp: otp);
            },
          ),

          // menu Feature
          ShellRoute(
            builder: (context, state, child) {
              return BlocProvider(
                create: (_) =>
                    MenuCubit(MenuRepoImplementation())..getCustomerProfile(),
                child: child,
              );
            },
            routes: [
              GoRoute(path: kMenuView, builder: (context, state) => MenuView()),
              GoRoute(
                path: kPersonalInfoProfileView,
                builder: (context, state) => PersonalInfoView(),
              ),
              GoRoute(
                path: kEditProfileView,
                builder: (context, state) => EditProfileView(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
