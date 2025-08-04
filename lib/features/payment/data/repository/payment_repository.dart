import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:restaurant/features/payment/data/data_source/payment_manager.dart';

class PaymentRepository {
  Future<Either<String, Unit>> processPayment({
    required double amount,
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
}
