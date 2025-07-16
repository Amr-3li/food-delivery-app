import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/chief_part/home/data/repository/running_order/running_orders_repository.dart';
import 'package:restaurant/features/chief_part/home/presentation/cubit/running_order/running_orders_state.dart';

class RunningOrdersCubit extends Cubit<RunningOrdersState> {
  final RunningOrdersRepository _repository;

  RunningOrdersCubit(this._repository) : super(RunningOrdersInitial());

  Future<void> fetchRunningOrders() async {
    emit(RunningOrdersLoading());
    try {
      final orders = await _repository.fetchRunningOrders();
      emit(RunningOrdersLoaded(orders));
    } catch (e) {
      emit(RunningOrdersError(e.toString()));
    }
  }

  Future<void> updateOrderStatus(int orderId, String status) async {
    try {
      await _repository.updateOrderStatus(orderId, status);
      await fetchRunningOrders();
    } catch (e) {
      emit(RunningOrdersError(e.toString()));
    }
  }
}
