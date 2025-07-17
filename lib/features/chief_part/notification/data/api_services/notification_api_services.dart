import 'package:dio/dio.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/core/network/api_helper.dart';

import 'package:restaurant/features/chief_part/notification/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';

class NotificationServicesApi {
  ApiHelper apiHelper = ApiHelper();

  NotificationServicesApi();

  // Map<String, dynamic> _getHeaders() {
  //   return {
  //     'Authorization':
  //         'Bearer 6|zq3OU0soHfdRsznwTWCxzn3Jk7Ouzut5hbHbNmeDe4ffe4a8',
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json',
  //   };
  // }

  Future<Either<Failure, List<NotificationsModel>>> getNotifications() async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: '${APIKey.baseApiUrl}/notifications',
        isProtected: true,
        isFormData: false,
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data is List) {
          final notifications = data
              .map((item) => NotificationsModel.fromJson(item))
              .toList();
          return Right(notifications);
        } else {
          return const Right([]);
        }
      } else {
        return Left(Failure(errorMessage: 'Failed to load notifications'));
      }
    } on DioException catch (e) {
      return Left(Failure(errorMessage: 'Network error: ${e.message}'));
    } catch (e) {
      return Left(Failure(errorMessage: 'Unexpected error: ${e.toString()}'));
    }
  }

  Future<Either<Failure, Unit>> markAsRead(String notificationId) async {
    try {
      await apiHelper.patch(
        endPoint: '${APIKey.baseApiUrl}/notifications/$notificationId/read',
        isProtected: true,
        isFormData: false,
      );
      return const Right(unit);
    } on DioException catch (e) {
      return Left(
        Failure(errorMessage: 'Failed to mark as read: ${e.message}'),
      );
    } catch (e) {
      return Left(Failure(errorMessage: 'Unexpected error: ${e.toString()}'));
    }
  }
}
