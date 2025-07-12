import 'package:restaurant/features/chief_part/notification/data/api_services/notification_api_services.dart';
import 'package:restaurant/features/chief_part/notification/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';

class NotificationRepository {
  final NotificationServicesApi apiService;

  NotificationRepository({required this.apiService});

  Future<Either<Failure, List<NotificationsModel>>> getNotifications() async {
    return await apiService.getNotifications();
  }

  Future<Either<Failure, Unit>> markAsRead(String notificationId) async {
    return await apiService.markAsRead(notificationId);
  }
}
