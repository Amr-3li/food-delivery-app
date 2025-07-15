// lib/features/chief_part/home/data/repositories/running_orders_repository.dart
import 'package:dio/dio.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/chief_part/home/data/models/running_order_item.dart';

abstract class RunningOrdersRepository {
  Future<List<RunningOrder>> fetchRunningOrders();
  Future<void> updateOrderStatus(int orderId, String status);
}

class RunningOrdersRepositoryImpl implements RunningOrdersRepository {
  final ApiHelper _apiHelper;

  RunningOrdersRepositoryImpl(this._apiHelper);

  @override
  Future<List<RunningOrder>> fetchRunningOrders() async {
    try {
      final response = await _apiHelper.getRequest(
        endPoint: EndPoints.chefOrdersRunning,
        isProtected: true,
        isFormData: false,
      );

      if (response.status && response.data != null) {
        return (response.data['data'] as List)
            .map((order) => RunningOrder.fromJson(order))
            .toList();
      } else {
        throw Exception(response.message);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Failed to load running orders');
    }
  }

  @override
  Future<void> updateOrderStatus(int orderId, String status) async {
    try {
      final response = await _apiHelper.putRequest(
        endPoint: EndPoints.updateOrderStatus(orderId, status),
        isProtected: true,
        isFormData: false,
      );

      if (!response.status) {
        throw Exception(response.message);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('Failed to update order status');
    }
  }
}
