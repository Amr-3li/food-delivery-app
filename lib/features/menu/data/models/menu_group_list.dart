import '../../../../core/icons.dart';
import 'menu_model.dart';

final List<MenuGroup> menuGroups = [

  // Group 1 : personal profile , addresses
  MenuGroup(
    items: [
      MenuItem(
        icon: Assets.assetsPersonalInfo,
        title: 'Personal Profile',
      ),

      MenuItem(
        icon: Assets.assetsAddresses,
        title: 'Addresses',
      ),
    ],
  ),

  // Group 2 : cart , favourites , notifications , payment method
  MenuGroup(
    items: [
      MenuItem(
        icon: Assets.assetsCart,
        title: 'Cart',
      ),

      MenuItem(
        icon: Assets.assetsFavourite,
        title: 'Favourites',
      ),

      MenuItem(
        icon: Assets.assetsNotifications,
        title: 'Notifications',
      ),

      MenuItem(
        icon: Assets.assetsPaymentMethod,
        title: 'Payment Method',
      ),
    ],
  ),

  // Group 3 :  FAQs , user reviews , settings
  MenuGroup(
    items: [
      MenuItem(
        icon: Assets.assetsFAQs,
        title: "FAQs",
      ),

      MenuItem(
        icon: Assets.assetsReviews,
        title: "User Reviews",
      ),

      MenuItem(
        icon: Assets.assetsSettings,
        title: "Settings",
      ),
    ],
  ),

  // Group 4 : logout
  MenuGroup(
    items: [
      MenuItem(
        icon: Assets.assetsLogout,
        title: "Logout",
      ),
    ],
  ),
];