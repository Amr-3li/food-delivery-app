import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chief_part/notification/data/repository/notification_repository.dart';
import 'package:restaurant/features/chief_part/notification/presentation/cubit/notification_state.dart';
import 'package:bloc/bloc.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository repository;

  NotificationCubit({required this.repository}) : super(NotificationInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());

    final result = await repository.getNotifications();

    result.fold(
      (failure) {
        emit(NotificationFailure(errorMessage: failure.errorMessage));
      },
      (notifications) {
        emit(NotificationSuccess(notifications: notifications));
      },
    );
  }

  Future<void> markNotificationAsRead(String notificationId) async {
    emit(NotificationLoading());

    final result = await repository.markAsRead(notificationId);

    await result.fold(
      (failure) async {
        emit(NotificationFailure(errorMessage: failure.errorMessage));
      },
      (_) async {
        emit(NotificationMarkedAsRead(notificationId: notificationId));
        await fetchNotifications(); // Refresh the list
      },
    );
  }
}
