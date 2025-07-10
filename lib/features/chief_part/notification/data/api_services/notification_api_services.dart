import 'package:dio/dio.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/features/chief_part/notification/data/models/notification_model.dart';

class NotificationServicesApi {
  Dio dio;
  NotificationServicesApi({required this.dio});
  Map<String, dynamic> _getHeaders() {
    return {
      'Authorization':
          'Bearer 15|XO9gx6yn5EmJcOAcbljbfHCqU7kbsjvoqhteKWhTc11d5dd4',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<List<NotificationsModel>> getNotifications() async {
    try {
      final response = await dio.get(
        '${APIKey.baseApiUrl}/notifications',
        options: Options(headers: _getHeaders()),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        return data.map((item) => NotificationsModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load notifications');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    }
  }

  Future<void> markAsRead(int notificationId) async {
    try {
      await dio.patch(
        '${APIKey.baseApiUrl}/notifications/$notificationId/read',
        options: Options(headers: _getHeaders()),
      );
    } on DioException catch (e) {
      throw Exception('Failed to mark as read: ${e.message}');
    }
  }
}
