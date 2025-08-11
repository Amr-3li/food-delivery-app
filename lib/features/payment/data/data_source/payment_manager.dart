import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:restaurant/core/dependency_injection/service_locator.dart';

class PaymentManager {
  static Future<bool> makePayment(int amount, String currency) async {
    try {
      String clientSecret = await _getClientSecret(
        amount,
        currency,
      );
      await _initializePaymentSheet(clientSecret);
      await Stripe.instance.presentPaymentSheet();
      return true; // Payment successful
    } catch (e, stackTrace) {
      debugPrint('Error adding new address: $e');
      debugPrint('StackTrace: $stackTrace');
      throw Exception(e.toString());
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,

        merchantDisplayName: 'Your Company Name',
      ),
    );
  }
}

Future<String> _getClientSecret(int amount, String currency) async {
  final dio = sl.get<Dio>(instanceName: 'stripeDio');
  try {
    final response = await dio.post(
      'payment_intents',
      data: {'amount': amount, 'currency': currency},
    );

    return response.data['client_secret'] as String;
  } catch (e) {
    throw Exception('Failed to create payment intent: $e');
  }
}
