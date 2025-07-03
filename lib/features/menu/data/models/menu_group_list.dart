import '../../../../core/icons.dart';
import 'menu_model.dart';

final List<MenuGroup> menuGroups = [
  // Group 1 : personal profile , addresses
  MenuGroup(
    items: [
      MenuItem(icon: AppIcons.assetsPersonalInfo, title: 'Personal Profile'),

      MenuItem(icon: AppIcons.assetsAddresses, title: 'Addresses'),
    ],
  ),

  // Group 2 : cart , favourites , notifications , payment method
  MenuGroup(
    items: [
      MenuItem(icon: AppIcons.assetsCart, title: 'Cart'),

      MenuItem(icon: AppIcons.assetsFavourite, title: 'Favourites'),

      MenuItem(icon: AppIcons.assetsNotifications, title: 'Notifications'),

      MenuItem(icon: AppIcons.assetsPaymentMethod, title: 'Payment Method'),
    ],
  ),

  // Group 3 :  FAQs , user reviews , settings
  MenuGroup(
    items: [
      MenuItem(icon: AppIcons.assetsFAQs, title: "FAQs"),

      MenuItem(icon: AppIcons.assetsReviews, title: "User Reviews"),

      MenuItem(icon: AppIcons.assetsSettings, title: "Settings"),
    ],
  ),

  // Group 4 : logout
  MenuGroup(
    items: [MenuItem(icon: AppIcons.assetsLogout, title: "Logout")],
  ),
];
