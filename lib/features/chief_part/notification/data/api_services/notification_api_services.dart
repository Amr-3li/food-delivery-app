import 'package:dio/dio.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/features/chief_part/notification/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:restaurant/core/error/failure.dart';

class NotificationServicesApi {
  final Dio dio;

  NotificationServicesApi({required this.dio});

  Map<String, dynamic> _getHeaders() {
    return {
      'Authorization':
          'Bearer 5|CcQu2XRuiWbsHv2tZjgLF9vMs6ARacAl7478Fk2x491557dc',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<Either<Failure, List<NotificationsModel>>> getNotifications() async {
    try {
      final response = await dio.get(
        '${APIKey.baseApiUrl}/notifications',
        options: Options(headers: _getHeaders()),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data is List) {
          final notifications =
              data.map((item) => NotificationsModel.fromJson(item)).toList();
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
      await dio.patch(
        '${APIKey.baseApiUrl}/notifications/$notificationId/read',
        options: Options(headers: _getHeaders()),
      );
      return const Right(unit);
    } on DioException catch (e) {
      return Left(
          Failure(errorMessage: 'Failed to mark as read: ${e.message}'));
    } catch (e) {
      return Left(Failure(errorMessage: 'Unexpected error: ${e.toString()}'));
    }
  }
}
