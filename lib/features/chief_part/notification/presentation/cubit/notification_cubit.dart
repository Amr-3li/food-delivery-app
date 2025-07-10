import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chief_part/notification/data/repository/notification_repository.dart';
import 'package:restaurant/features/chief_part/notification/presentation/cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationRepository repository;

  NotificationCubit({required this.repository}) : super(NotificationInitial());

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    try {
      final notifications = await repository.getNotifications();
      emit(NotificationSuccess(notifications: notifications));
    } catch (e) {
      emit(NotificationFailure(errorMessage: e.toString()));
    }
  }

  Future<void> markNotificationAsRead(int notificationId) async {
    try {
      await repository.markAsRead(notificationId);
      emit(NotificationMarkedAsRead(notificationId: notificationId));
      // Refresh notifications after marking as read
      await fetchNotifications();
    } catch (e) {
      emit(NotificationFailure(errorMessage: e.toString()));
    }
  }
}
