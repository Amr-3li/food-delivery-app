import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';
import 'package:restaurant/core/helper/app_responsive.dart';
import 'package:restaurant/core/utils/color_helper.dart';
import 'package:restaurant/core/utils/icons.dart';
import 'package:restaurant/core/utils/styles.dart';
import 'package:restaurant/features/cart/presentation/views/wigdets/back_icon_appbar.dart';
import 'package:restaurant/features/chief_part/notification/presentation/view/widgets/notification_listtile.dart';
import 'package:sizer/sizer.dart';
import 'package:restaurant/features/chief_part/notification/presentation/cubit/notification_cubit.dart';
import 'package:restaurant/features/chief_part/notification/presentation/cubit/notification_state.dart';
import 'package:svg_flutter/svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('d MMM').format(date); // E.g., 10 Jul
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NotificationCubit>()..fetchNotifications(),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 22,
                backgroundColor: ColorsHelper.lightBabyBlue,
                child: SvgPicture.asset(AppIcons.iIcon),
              ),
            ),
          ),
          toolbarHeight: AppResponsive.height(context, value: 80),
          title: Text(
            'Notifications',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return const Center(child: CircularProgressIndicator(color: Colors.orange, strokeWidth: 2.0, strokeAlign: 3,));
            } else if (state is NotificationFailure) {
              return Center(child: Text("Error: ${state.errorMessage}"));
            } else if (state is NotificationSuccess) {
              final notifications = state.notifications;

              if (notifications.isEmpty) {
                return const Center(child: Text("No notifications found."));
              }

              return ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final item = notifications[index];
                  return ListtileNotifications(
                    imageUrl:
                        "https://cdn-icons-png.flaticon.com/512/3119/3119338.png", // fallback image
                    title: item.title,
                    subtitle: item.subtitle,
                    date: formatDate(item.date),
                    onTap: () {
                      context.read<NotificationCubit>().markNotificationAsRead(
                        item.id,
                      ); // Use the real ID
                    },
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
