import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/features/cart/data/models/cart_model.dart';

class CartApiServices {
  Dio dio;
  CartApiServices({required this.dio});
  Map<String, dynamic> _getHeaders() {
    return {
      'Authorization':
          'Bearer 15|XO9gx6yn5EmJcOAcbljbfHCqU7kbsjvoqhteKWhTc11d5dd4',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  Future<List<CartModel>> getCart() async {
    try {
      final response = await dio.get(
        "${APIKey.baseApiUrl}/cart",
        options: Options(
          headers: _getHeaders(),
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          // Return a list with a single cart (most common scenario)
          return [CartModel.fromJson(response.data)];
        }
        return <CartModel>[];
      } else {
        final errorMessage = response.data['message'] ?? 'Failed to load cart';
        throw Exception(errorMessage);
      }
    } catch (e) {
      debugPrint("Error fetching cart: $e");
      rethrow;
    }
  }

  Future<void> addToCart({
    required int dishId,
    required int sizeId,
    required int quantity,
  }) async {
    await dio.post(
      '/cart/items',
      data: {'dish_id': dishId, 'size_id': sizeId, 'quantity': quantity},
    );
  }

  Future<void> updateCartItem({
    required int itemId,
    required int quantity,
  }) async {
    await dio.put('/cart/items/$itemId', data: {'quantity': quantity});
  }

  Future<void> deleteCartItem(int itemId) async {
    await dio.delete('/cart/$itemId');
  }
}
