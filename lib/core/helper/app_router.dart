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
import 'package:restaurant/features/reviews/data/repository/review_repository_implementation.dart';
import 'package:restaurant/features/reviews/presentation/cubit/reviews_cubit.dart';
import 'package:restaurant/features/reviews/presentation/views/my_reviews_view.dart';
import 'package:restaurant/features/splash/presentation/views/splash_view.dart';
import '../../features/address/presentaion/manger/get_addresses/get_addresses_cubit.dart';
import '../../features/address/presentaion/view/add_new_address_view.dart';
import '../../features/cart/presentation/cubit/cart_cubit.dart';
import '../../features/home/data/repository/meal_details_repository.dart';
import '../../features/home/presentation/cubit/category/category_cubit.dart';
import '../../features/home/presentation/cubit/meal_details/meal_details_cubit.dart';
import '../../features/home/presentation/cubit/resturant/resturant_cubit.dart';
import '../../features/home/presentation/views/food_details_view.dart';
import '../../features/home/presentation/views/home_user_view.dart';
import '../../features/menu/data/repo/menu/menu_repo_implemation.dart';
import '../../features/menu/presentation/manger/menu/menu_cubit.dart';
import '../../features/menu/presentation/views/faqs_view.dart';
import '../../features/orders/data/repo/my_orders_repo_implemation.dart';
import '../../features/payment/presentaion/cubit/payment_cubit.dart';
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
  static const String kMyReviews = '/myReviews';
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
  static const String kForgetPassword = "/forgetPassword";

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _networkShellNavigatorKey = GlobalKey<NavigatorState>();
  static final _homeShellNavigatorKey = GlobalKey<NavigatorState>();
  static final _menuShellNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: kSplashView,
        pageBuilder: (context, state) => MaterialPage(
          key: ValueKey('splashView_${UniqueKey().toString()}'),
          child: const SplashView(),
        ),
      ),

      // Network check shell route
      ShellRoute(
        navigatorKey: _networkShellNavigatorKey,
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
          GoRoute(
            path: kOnboardingView,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('onboardingView_${UniqueKey().toString()}'),
              child: OnboardingPage(),
            ),
          ),

          GoRoute(
            path: kLoginView,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('loginView_${UniqueKey().toString()}'),
              child: LoginView(),
            ),
          ),

          GoRoute(
            path: kSingUp,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('signUpView_${UniqueKey().toString()}'),
              child: SinUpView(),
            ),
          ),

          GoRoute(
            path: kForgetPassword,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('forgetPasswordView_${UniqueKey().toString()}'),
              child: ForgetPasswordView(),
            ),
          ),

          GoRoute(
            path: kVerifyEmail,
            pageBuilder: (context, state) {
              final email = state.extra as String;
              return MaterialPage(
                key: ValueKey(
                  'verifyEmailView_${email}_${UniqueKey().toString()}',
                ),
                child: VertificationView(email: email),
              );
            },
          ),

          GoRoute(
            path: kSendOtp,
            pageBuilder: (context, state) {
              final email = state.extra as String;
              return MaterialPage(
                key: ValueKey('sendOtpView_${email}_${UniqueKey().toString()}'),
                child: SentOtp(email: email),
              );
            },
          ),

          // Home View and cubit shell route
          ShellRoute(
            navigatorKey: _homeShellNavigatorKey,
            builder: (context, state, child) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => sl<CategoryCubit>()..fetchCategories(),
                  ),
                  BlocProvider(
                    create: (_) => RestaurantCubit(sl())..getRestaurants(),
                  ),
                  BlocProvider(create: (_) => sl<CartCubit>()..getCart()),
                  BlocProvider(create: (_) => sl<PaymentCubit>()),
                  BlocProvider(create: (_) => sl<GetAddressesCubit>()),
                  BlocProvider(
                    create: (context) =>
                        ReviewsCubit(ReviewsRepositoryImplementation()),
                  ),
                ],
                child: child,
              );
            },
            routes: [
              GoRoute(
                path: kHomeUserView,
                pageBuilder: (context, state) => MaterialPage(
                  key: ValueKey('homeUserView_${UniqueKey().toString()}'),
                  child: HomeUserView(),
                ),
              ),

              GoRoute(
                path: kAllCategoryView,
                pageBuilder: (context, state) => MaterialPage(
                  key: ValueKey('allCategoryView_${UniqueKey().toString()}'),
                  child: AllCategoriesView(),
                ),
              ),

              GoRoute(
                path: kCategoryDetailsView,
                pageBuilder: (context, state) => MaterialPage(
                  key: ValueKey(
                    'categoryDetailsView_${state.path}_${UniqueKey().toString()}',
                  ),
                  child: CategoryDetailsView(state: state),
                ),
              ),

              GoRoute(
                path: kAllRestaurantsView,
                pageBuilder: (context, state) => MaterialPage(
                  key: ValueKey('allRestaurantsView_${UniqueKey().toString()}'),
                  child: const AllRestaurantsView(),
                ),
              ),

              GoRoute(
                path: kRestaurantDetailsView,
                pageBuilder: (context, state) {
                  final int id = state.extra as int;
                  return MaterialPage(
                    key: ValueKey(
                      'restaurantDetailsView_${id}_${UniqueKey().toString()}',
                    ),
                    child: RestaurantDetailsView(id: id),
                  );
                },
              ),

              GoRoute(
                path: kFoodDetailsView,
                pageBuilder: (context, state) {
                  final int id = state.extra as int;
                  return MaterialPage(
                    key: ValueKey(
                      'foodDetailsView_${id}_${UniqueKey().toString()}',
                    ),
                    child: BlocProvider(
                      create: (context) =>
                          MealDetailsCubit(MealDetailsRepository())
                            ..getMealDetails(id: id),
                      child: FoodDetailsView(id: id),
                    ),
                  );
                },
              ),

              GoRoute(
                path: kCartView,
                name: "cartView",
                pageBuilder: (context, state) => MaterialPage(
                  key: ValueKey(
                    'cartView_${UniqueKey().toString()} ${state.extra}',
                  ),
                  child: CartView(),
                ),
              ),

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
                path: kSearchScreenView,
                pageBuilder: (context, state) => MaterialPage(
                  key: ValueKey('searchScreenView_${UniqueKey().toString()}'),
                  child: SearchView(),
                ),
              ),

              // Menu Feature Shell Route
              ShellRoute(
                navigatorKey: _menuShellNavigatorKey,
                builder: (context, state, child) {
                  return BlocProvider(
                    create: (_) =>
                        MenuCubit(MenuRepoImplementation())
                          ..getCustomerProfile(),
                    child: child,
                  );
                },
                routes: [
                  GoRoute(
                    path: kMenuView,
                    pageBuilder: (context, state) => MaterialPage(
                      key: ValueKey('menuView_${UniqueKey().toString()}'),
                      child: MenuView(),
                    ),
                  ),

                  GoRoute(
                    path: kPersonalInfoProfileView,
                    pageBuilder: (context, state) => MaterialPage(
                      key: ValueKey(
                        'personalInfoProfileView_${UniqueKey().toString()}',
                      ),
                      child: PersonalInfoView(),
                    ),
                  ),

                  GoRoute(
                    path: kEditProfileView,
                    pageBuilder: (context, state) => MaterialPage(
                      key: ValueKey(
                        'editProfileView_${UniqueKey().toString()}',
                      ),
                      child: EditProfileView(),
                    ),
                  ),
                ],
              ),
            ],
          ),

          GoRoute(
            path: kChefDetailsView,
            pageBuilder: (context, state) {
              final ChefModel chefModel = state.extra as ChefModel;
              return MaterialPage(
                key: ValueKey(
                  'chefDetailsView_${chefModel.id}_${UniqueKey().toString()}',
                ),
                child: ChefDetailsView(chefModel: chefModel),
              );
            },
          ),

          GoRoute(
            path: kChifHome,
            pageBuilder: (context, state) {
              final chefModel = state.extra as UserModel;
              return MaterialPage(
                key: ValueKey(
                  'chifHomeView_${chefModel.name}_${UniqueKey().toString()}',
                ),
                child: ChifHomeView(chefModel: chefModel),
              );
            },
          ),

          GoRoute(
            path: kChatView,
            name: "chat",
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('chatView_${UniqueKey().toString()}'),
              child: const ChatScreen(),
            ),
          ),

          GoRoute(
            path: kChifFoodDetails,
            name: "chifFoodDetails",
            pageBuilder: (context, state) {
              final meal = state.extra as Meal;
              return MaterialPage(
                key: ValueKey(
                  'chifFoodDetails_${meal.id}_${UniqueKey().toString()}',
                ),
                child: FoodDetailsPage(meal: meal),
              );
            },
          ),

          GoRoute(
            path: kAddNewItem,
            name: "addNewItem",
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('addNewItem_${UniqueKey().toString()}'),
              child: AddNewItems(),
            ),
          ),

          GoRoute(
            path: kChifFoodList,
            name: "chifFoodList",
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('chifFoodList_${UniqueKey().toString()}'),
              child: MyFoodList(),
            ),
          ),

          GoRoute(
            path: kMessageListView,
            name: "messageList",
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('messageListView_${UniqueKey().toString()}'),
              child: ChatListScreen(),
            ),
          ),

          GoRoute(
            path: kMyReviews,
            name: "MyReviews",
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('reviewView_${UniqueKey().toString()}'),
              child: BlocProvider(
                create: (context) => ReviewsCubit(ReviewsRepositoryImplementation())..getMyReviews(),
                child: MyReviewsView(),
              ),
            ),
          ),

          GoRoute(
            path: kSucessPaymentView,
            name: "successPayment",
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('successPayment_${UniqueKey().toString()}'),
              child: const SucessPayment(),
            ),
          ),

          GoRoute(
            path: kNotificationView,
            name: "notification",
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('notificationView_${UniqueKey().toString()}'),
              child: NotificationScreen(),
            ),
          ),

          // GoRoute(
          //   path: kResturantReview,
          //   name: "resturantReview",
          //   pageBuilder: (context, state) => MaterialPage(
          //     key: ValueKey('resturantReview_${UniqueKey().toString()}'),
          //     child: ReviewResturantScreen(),
          //   ),
          // ),
          GoRoute(
            path: kChatListView,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('chatListView_${UniqueKey().toString()}'),
              child: ChatListScreenChief(),
            ),
          ),

          GoRoute(
            path: kChatChiefView,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('chatChiefView_${UniqueKey().toString()}'),
              child: ChatScreenChief(),
            ),
          ),

          GoRoute(
            path: kMenuChiefView,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('menuChiefView_${UniqueKey().toString()}'),
              child: ChiefMenuScreen(),
            ),
          ),

          GoRoute(
            path: kWithdrawView,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('withdrawView_${UniqueKey().toString()}'),
              child: WithdrawView(),
            ),
          ),

          GoRoute(
            path: kAddresses,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('addressesView_${UniqueKey().toString()}'),
              child: const AddressView(),
            ),
          ),

          GoRoute(
            path: kFQS,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('fqsView_${UniqueKey().toString()}'),
              child: const FaqsView(),
            ),
          ),

          GoRoute(
            path: kFavorite,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('favoriteView_${UniqueKey().toString()}'),
              child: const FavoritesView(),
            ),
          ),

          GoRoute(
            path: kAddAddressView,
            pageBuilder: (context, state) => MaterialPage(
              key: ValueKey('addAddressView_${UniqueKey().toString()}'),
              child: BlocProvider(
                create: (context) =>
                    AddAddressCubit(AddAddressRepoImplementation())
                      ..getCurrentLocation(),
                child: AddNewAddressView(
                  addressesModel: state.extra != null
                      ? state.extra as AddressesModel
                      : AddressesModel(),
                ),
              ),
            ),
          ),

          GoRoute(
            path: kResetPassword,
            pageBuilder: (context, state) {
              final data = state.extra as Map<String, String>;
              return MaterialPage(
                key: ValueKey(
                  'resetPasswordView_${data['email']}_${UniqueKey().toString()}',
                ),
                child: ConfiremPassword(
                  email: data['email']!,
                  otp: data['otp']!,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
