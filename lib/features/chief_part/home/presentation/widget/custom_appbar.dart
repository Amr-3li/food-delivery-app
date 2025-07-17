import 'package:flutter/material.dart';
import 'package:restaurant/core/icons.dart';
import 'package:svg_flutter/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String dynamicText;
  final VoidCallback onLeadingPressed;
  final String userImageUrl;

  const CustomAppBar({
    super.key,
    required this.dynamicText,
    required this.onLeadingPressed,
    required this.userImageUrl,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: SvgPicture.asset(AppIcons.iMenu),
          onPressed: onLeadingPressed,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "chef",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              dynamicText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(userImageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
