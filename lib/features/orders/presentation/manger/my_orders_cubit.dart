import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:restaurant/features/orders/data/models/my_orders_model.dart';
import 'package:restaurant/features/orders/data/repo/my_orders_repo.dart';

part 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit(this.myOrdersRepo) : super(MyOrdersInitial());

  final MyOrdersRepo myOrdersRepo;

  static MyOrdersCubit get(context) => BlocProvider.of(context);

  List<Item> currentOrders = [];
  List<Item> pastOrders = [];


  Future<void> getMyOrders({required String status}) async {
    final result = await myOrdersRepo.getMyOrders(status: status);

    pastOrders.clear();

    result.fold(
      (failure) {
        emit(GetMyOrdersFailure(errorMessage: failure));
      },
      (orders) {
        emit(GetMyOrdersSuccess());
        orders.empty.forEach((element) {
          if (element.status == 'pending') {
            currentOrders = element.items;
          } else if (element.status == 'completed' || element.status == 'cancelled') {
            pastOrders.addAll(element.items);
          }
        });
      },
    );
  }

  void changeOrderStatus({required int id, required String status}) async {
    final result = await myOrdersRepo.changeOrderStatus(id: id,status: status);

    result.fold(
          (failure) {
        emit(ChangeOrderStatusFailure(errorMessage: failure));
      },
          (message) async {
        emit(ChangeOrderStatusSuccess(message: message));
        currentOrders.clear();
      },
    );
  }
}
