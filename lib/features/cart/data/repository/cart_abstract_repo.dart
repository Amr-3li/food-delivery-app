import 'package:restaurant/features/cart/data/models/cart_model.dart';

abstract class CartAbstractRepository {
  Future<CartModel> getCart();
  Future<void> fetchCart();
  Future<void> addToCart({required int dishId, required double price});
  Future<void> updateCartItem({required int itemId, required int quantity});

  Future<void> deleteCartItem(int itemId);
  Future<void> clearCart();
}
