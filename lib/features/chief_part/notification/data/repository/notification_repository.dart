import 'package:restaurant/features/chief_part/notification/data/api_services/notification_api_services.dart';
import 'package:restaurant/features/chief_part/notification/data/models/notification_model.dart';

class NotificationRepository {
  final NotificationServicesApi apiService;

  NotificationRepository({required this.apiService});

  Future<List<NotificationsModel>> getNotifications() async {
    return await apiService.getNotifications();
  }

  Future<void> markAsRead(int notificationId) async {
    await apiService.markAsRead(notificationId);
  }
}
