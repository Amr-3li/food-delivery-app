import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/core/network/api_response.dart';
import 'package:restaurant/core/network/end_points.dart';
import 'package:restaurant/features/payment/data/data_source/payment_manager.dart';

class PaymentRepository {
  Future<Either<String, Unit>> processPayment({
    required int amount,
    required String currency,
  }) async {
    try {
      final success = await PaymentManager.makePayment(amount, currency);
      if (success) {
        return right(unit); // Success
      } else {
        return left("Payment failed or was cancelled.");
      }
    } catch (e) {
      log("Stripe Payment processing failed: $e");
      return left("An unexpected error occurred.");
    }
  }
  
  ApiHelper apiHelper = ApiHelper();
  
  Future<String> createOrder() async {
    try {
      final response = await apiHelper.postRequest(endPoint: EndPoints.orders, isProtected: true);
      if (response.status) {
        return response.message;
      } else {
        return response.message;
      }
    } catch (e) {
      ApiResponse errorResponse = ApiResponse.fromError(e);
      return errorResponse.message;
    }
  }
}
