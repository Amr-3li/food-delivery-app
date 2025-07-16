import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/cart/data/models/cart_model.dart';
import 'package:restaurant/features/cart/data/repository/cart_repository.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  final CartRepository cartRepository;

  CartCubit({required this.cartRepository}) : super(CartInitialState());

  Future<void> getCart() async {
    emit(CartLoadingState());
    try {
      final carts = await cartRepository.getCart();
      if (carts.isNotEmpty) {
        emit(CartSuccessState(cartModel: carts.first));
      } else {
        emit(
          CartSuccessState(
            cartModel: CartModel(
              id: 0,
              customerId: 0,
              status: 'empty',
              items: [],
              total: 0,
            ),
          ),
        );
      }
    } catch (e) {
      emit(CartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> addToCart({required int dishId, required int price}) async {
    emit(CartLoadingState());
    try {
      await cartRepository.addToCart(dishId: dishId, price: price);

      /// ⏱ Wait 500ms to ensure backend processes cart update
      await Future.delayed(const Duration(milliseconds: 500));

      await getCart();
    } catch (e) {
      emit(CartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> updateCartItem({
    required int itemId,
    required int quantity,
  }) async {
    emit(CartLoadingState());
    try {
      await cartRepository.updateCartItem(itemId: itemId, quantity: quantity);
      // Refresh cart after updating
      await getCart();
    } catch (e) {
      emit(CartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> deleteCartItem(int itemId) async {
    emit(CartLoadingState());
    try {
      await cartRepository.deleteCartItem(itemId);
      // Refresh cart after deletion
      await getCart();
    } catch (e) {
      emit(CartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> clearCart() async {
    emit(CartLoadingState());
    try {
      await cartRepository.clearCart();
      await getCart(); // Refresh cart state
    } catch (e) {
      emit(CartFailureState(errorMessage: e.toString()));
    }
  }
}
