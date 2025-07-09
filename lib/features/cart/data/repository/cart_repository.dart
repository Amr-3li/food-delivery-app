import 'package:restaurant/features/cart/data/services/cart_services.dart';

import '../models/cart_model.dart';

class CartRepository {
  final CartApiServices cartApiService;
  List<CartModel> _cartItems = [];
  CartRepository(this.cartApiService);

  Future<List<CartModel>> getCart() => cartApiService.getCart();

Future<void> fetchCart() async {
    _cartItems = await cartApiService.getCart();
  }

  Future<void> addToCart({
    required int dishId,
    required int sizeId,
    required int quantity,
  }) => cartApiService.addToCart(
    dishId: dishId,
    sizeId: sizeId,
    quantity: quantity,
  );

  Future<void> updateCartItem({required int itemId, required int quantity}) =>
      cartApiService.updateCartItem(itemId: itemId, quantity: quantity);

  Future<void> deleteCartItem(int itemId) =>
      cartApiService.deleteCartItem(itemId);
}
