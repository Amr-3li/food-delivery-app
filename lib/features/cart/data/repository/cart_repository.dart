import 'package:restaurant/features/cart/data/repository/cart_abstract_repo.dart';
import 'package:restaurant/features/cart/data/services/cart_services.dart';

import '../models/cart_model.dart';

class CartRepository extends CartAbstractRepository {
  final CartApiServices cartApiService;
  CartRepository(this.cartApiService);

  @override
  Future<List<CartModel>> getCart() => cartApiService.getCart();
  @override
  Future<void> fetchCart() async {}

  @override
  Future<void> addToCart({required int dishId, required int price}) =>
      cartApiService.addToCart(dishId: dishId, price: price);
  @override
  Future<void> updateCartItem({required int itemId, required int quantity}) =>
      cartApiService.updateCartItem(itemId: itemId, quantity: quantity);
  @override
  Future<void> deleteCartItem(int itemId) =>
      cartApiService.deleteCartItem(itemId);
  @override
  Future<void> clearCart() => cartApiService.clearCart();
}
