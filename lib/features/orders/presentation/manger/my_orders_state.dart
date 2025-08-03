part of 'my_orders_cubit.dart';

@immutable
sealed class MyOrdersState {}

final class MyOrdersInitial extends MyOrdersState {}

final class GetMyOrdersSuccess extends MyOrdersState {}

final class GetMyOrdersFailure extends MyOrdersState {
  final String errorMessage;

  GetMyOrdersFailure({required this.errorMessage});
}

final class ChangeOrderStatusSuccess extends MyOrdersState {
  final String message;

  ChangeOrderStatusSuccess({required this.message});
}

final class ChangeOrderStatusFailure extends MyOrdersState {
  final String errorMessage;

  ChangeOrderStatusFailure({required this.errorMessage});
}
