import 'package:dartz/dartz.dart';
import 'package:restaurant/features/orders/data/models/my_orders_model.dart';

abstract class MyOrdersRepo {
  Future<Either<String, MyOrdersModel>> getMyOrders({required String status});
  Future<Either<String, String>> changeOrderStatus({required int id, required String status});
}