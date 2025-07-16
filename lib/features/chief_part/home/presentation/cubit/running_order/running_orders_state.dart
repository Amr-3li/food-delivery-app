import 'package:restaurant/features/chief_part/home/data/models/running_order_item.dart';

abstract class RunningOrdersState {}

class RunningOrdersInitial extends RunningOrdersState {}

class RunningOrdersLoading extends RunningOrdersState {}

class RunningOrdersLoaded extends RunningOrdersState {
  final List<RunningOrder> orders;

  RunningOrdersLoaded(this.orders);
}

class RunningOrdersError extends RunningOrdersState {
  final String message;

  RunningOrdersError(this.message);
}
