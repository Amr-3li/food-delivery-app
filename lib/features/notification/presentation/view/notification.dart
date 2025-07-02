import 'package:flutter/material.dart';
import 'package:restaurant/core/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/notification/data/models/notification_model.dart';
import 'package:restaurant/features/notification/presentation/view/widgets/notification_listtile.dart';
import 'package:svg_flutter/svg.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final List<NotificationsModel> notifications = [
    NotificationsModel(
      imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      title: "Tanbir Ahmed Placed anew order",
      subtitle: "20 min age",
    ),
    NotificationsModel(
      imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      title: "Tanbir Ahmed Placed anew order",
      subtitle: "20 min age",
    ),
    NotificationsModel(
      imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      title: "Tanbir Ahmed Placed anew order",
      subtitle: "20 min age",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
            radius: 10,
            child: SvgPicture.asset(Assets.assetsImagesIcon),
          ),
        ),
        title: Text(
          'Notifications',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListtileNotifications(
            imageUrl: notifications[index].imageUrl,
            title: notifications[index].title,
            subtitle: notifications[index].subtitle,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ChatScreen(userId: user.id),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
