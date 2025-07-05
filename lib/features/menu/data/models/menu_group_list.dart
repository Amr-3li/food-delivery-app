import '../../../../core/icons.dart';
import 'menu_model.dart';
import '../../../../core/helper/app_router.dart'; // Make sure to import your router constants

final List<MenuGroup> menuGroups = [
  // Group 1 : personal profile , addresses
  MenuGroup(
    items: [
      MenuItem(
        icon: AppIcons.assetsPersonalInfo,
        title: 'Personal Profile',
        route: AppRouter.kEditProfileView,
      ),
      MenuItem(
        icon: AppIcons.assetsAddresses,
        title: 'Addresses',
        route: AppRouter.kAddresses,
      ),
    ],
  ),

  // Group 2 : cart , favourites , notifications , payment method
  MenuGroup(
    items: [
      MenuItem(
        icon: AppIcons.assetsCart,
        title: 'Cart',
        route: AppRouter.kCartView,
      ),
      MenuItem(
        icon: AppIcons.assetsFavourite,
        title: 'Favourites',
        route: AppRouter.kFavorite,
      ),
      MenuItem(
        icon: AppIcons.assetsNotifications,
        title: 'Notifications',
        route: AppRouter.kNotificationView,
      ),
      // MenuItem(
      //   icon: AppIcons.assetsPaymentMethod,
      //   title: 'Payment Method',
      //   route: AppRouter.k,
      // ),
    ],
  ),

  // Group 3 : FAQs , user reviews , settings
  MenuGroup(
    items: [
      MenuItem(icon: AppIcons.assetsFAQs, title: "FAQs", route: AppRouter.kFQS),
      MenuItem(
        icon: AppIcons.assetsReviews,
        title: "User Reviews",
        route: AppRouter.kAddReviewView,
      ),
      // MenuItem(
      //   icon: AppIcons.assetsSettings,
      //   title: "Settings",
      //   route: AppRouter.kSettings,
      // ),
    ],
  ),

  // Group 4 : logout
  MenuGroup(
    items: [
      MenuItem(
        icon: AppIcons.assetsLogout,
        title: "Logout",
        isLogout: true, // so you can check for logout in logic
      ),
    ],
  ),
];
