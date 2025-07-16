import 'package:flutter/material.dart';
import 'package:restaurant/core/constant_text.dart';
import 'package:restaurant/core/network/api_helper.dart';
import 'package:restaurant/features/cart/data/models/cart_model.dart';

class CartApiServices {
  ApiHelper apiHelper = ApiHelper();
  CartApiServices();
  // Map<String, dynamic> _getHeaders() {
  //   return {
  //     'Authorization':
  //         'Bearer 6|zq3OU0soHfdRsznwTWCxzn3Jk7Ouzut5hbHbNmeDe4ffe4a8',
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json',
  //   };
  // }

  Future<List<CartModel>> getCart() async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: "${APIKey.baseApiUrl}/cart",
        isFormData: false,
        isProtected: true,
        // options: Options(
        //   headers: _getHeaders(),
        //   validateStatus: (status) => status! < 500,
        // ),
      );

      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
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
    String sizeName = "large",
    required int price,
    String note = "note",
  }) async {
    await apiHelper.postRequest(
      endPoint: '${APIKey.baseApiUrl}/cart/items',
      data: {
        'dish_id': dishId,
        'size_name': sizeName,
        'note': note,
        "price": price,
      },
      isFormData: false,
      isProtected: true,
    );
  }

  Future<void> updateCartItem({
    required int itemId,
    required int quantity,
  }) async {
    await apiHelper.putRequest(
      endPoint: '${APIKey.baseApiUrl}/cart/items/$itemId',
      data: {'quantity': quantity},
      isProtected: true,
      isFormData: false,
    );
  }

  Future<void> deleteCartItem(int itemId) async {
    await apiHelper.deleteRequest(
      endPoint: '${APIKey.baseApiUrl}/cart/$itemId',
      isProtected: true,
    );
  }

  Future<void> clearCart() async {
    final response = await apiHelper.postRequest(
      endPoint: '${APIKey.baseApiUrl}/cart/clear',
      isProtected: true,
      isFormData: false,
    );

    if (response.statusCode != 200 || response.data['status'] != true) {
      throw Exception(response.data['message'] ?? 'Failed to clear cart');
    }
  }
}
