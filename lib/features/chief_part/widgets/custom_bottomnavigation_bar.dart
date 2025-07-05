import 'package:flutter/material.dart';
import 'package:restaurant/core/helper/app_router.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:svg_flutter/svg.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final BuildContext context;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.context,
  });

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(AppRouter.kChifHome);
        break;
      case 1:
        GoRouter.of(context).go(AppRouter.kChifFoodList);
        break;
      case 2:
        GoRouter.of(context).push(AppRouter.kAddNewItem);
        break;
      case 3:
        break;
      case 4:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.ifoodlist,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 0 ? Colors.orange : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.iChifMenu,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 1 ? Colors.orange : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Food List',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: currentIndex == 2 ? Colors.orange : Colors.grey,
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              AppIcons.iPlus,
              width: 28,
              height: 28,
              colorFilter: ColorFilter.mode(
                ColorsHelper.orange,
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.iBell,
            width: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 2 ? Colors.orange : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.iMessage,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              currentIndex == 4 ? Colors.orange : Colors.grey,
              BlendMode.srcIn,
            ),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
