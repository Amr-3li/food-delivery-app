import 'package:dartz/dartz.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/api_response.dart';
import 'package:restaurant/core/network/end_points.dart';

import 'package:restaurant/features/orders/data/models/my_orders_model.dart';

import 'my_orders_repo.dart';

class MyOrdersRepoImplementation implements MyOrdersRepo {
  MyOrdersRepoImplementation._internal();
  static final MyOrdersRepoImplementation _instance =
      MyOrdersRepoImplementation._internal();
  factory MyOrdersRepoImplementation() => _instance;

  ApiHelper apiHelper = ApiHelper();

  @override
  Future<Either<String, MyOrdersModel>> getMyOrders({
    required String status,
  }) async {
    try {
      final ApiResponse response = await apiHelper.getRequest(
        endPoint: '${EndPoints.getMyOrders}/status=${status}',
        isProtected: true,
      );

      if (response.data != null) {
        final MyOrdersModel myOrdersModel = MyOrdersModel.fromJson(
          response.data,
        );
        return right(myOrdersModel);
      } else {
        return left("Not Found Orders.");
      }
    } catch (error) {
      final errorMessage = ApiResponse.fromError(error);
      return left(errorMessage.message);
    }
  }

  @override
  Future<Either<String, String>> changeOrderStatus({
    required int id,
    required String status
  }) async {
    try {
      final ApiResponse response = await apiHelper.postRequest(
        endPoint: '${EndPoints.changeOrderStatus}/$id}',
        isProtected: true,
        data: {
          'status': status,
        },
      );

      if (response.data != null) {
        return right(response.data['message'] ?? "Order status updated successfully");
      } else {
        return left('Failed to update order status');
      }
    } catch (error) {
      final errorMessage = ApiResponse.fromError(error);
      return left(errorMessage.message);
    }
  }
}
