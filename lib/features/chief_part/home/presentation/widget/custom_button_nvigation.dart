import 'package:flutter/material.dart';
import 'package:restaurant/core/icons.dart';
import 'package:svg_flutter/svg.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int? currentIndex;
  final Function(int)? onTap;

  const CustomBottomNavBar({super.key, this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex ?? 0,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.iChifMenu, width: 24, height: 24),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.ifoodlist, width: 24, height: 24),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white, // White background
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.orange, // Orange outline
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
              color: Colors.orange, // Black plus icon
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.iBell, width: 24, height: 24),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.iUser, width: 24, height: 24),
          label: '',
        ),
      ],
    );
  }
}
