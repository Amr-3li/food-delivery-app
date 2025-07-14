import 'package:flutter/material.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:sizer/sizer.dart';

class ListtileNotifications extends StatelessWidget {
  const ListtileNotifications({
    super.key,
    required this.imageUrl,
    required this.subtitle,
    required this.title,
    this.onTap,
    required this.date,
  });
  final String imageUrl;
  final String title;
  final String subtitle;
  final String? date;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 35,
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: SizedBox(
        width: 40.w,
        child: Text(title, style: Styles.textStyle14),
      ),
      subtitle: Text(
        subtitle,
        style: Styles.textStyle13.copyWith(fontWeight: FontWeight.w400),
      ),
      trailing: date != null ? Text(date!) : null,
      onTap: onTap,
      //   trailing: IconButton(
      //     icon: const Icon(Icons.delete, color: Colors.red),
      //     onPressed: onDelete,
      //   ),
    );
  }
}
