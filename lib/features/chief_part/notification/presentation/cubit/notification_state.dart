import 'package:restaurant/features/chief_part/notification/data/models/notification_model.dart';

class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final List<NotificationsModel> notifications;
  NotificationSuccess({required this.notifications});
}

class NotificationFailure extends NotificationState {
  final String errorMessage;
  NotificationFailure({required this.errorMessage});
}

class NotificationMarkedAsRead extends NotificationState {
  final int notificationId;
  NotificationMarkedAsRead({required this.notificationId});
}
