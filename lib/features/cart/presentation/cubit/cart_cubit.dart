import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/cart/data/models/cart_model.dart';
import 'package:restaurant/features/cart/data/repository/cart_repository.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  final CartRepository cartRepository;

  CartCubit({required this.cartRepository}) : super(CartInitialState());

  CartModel? cartModel;

  Future<void> getCart() async {
    emit(CartLoadingState());
    try {
      final CartModel cart = await cartRepository.getCart();
      if (cart.items.isNotEmpty) {
        cartModel = cart;
        emit(CartSuccessState());
      } else {
        cartModel = null;
        emit(CartSuccessState());
      }
    } catch (e) {
      emit(CartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> addToCart({required int dishId, required double price}) async {
    if (!isClosed) emit(CartLoadingState());
    try {
      await cartRepository.addToCart(dishId: dishId, price: price);

      /// ⏱ Wait 500ms to ensure backend processes cart update
      await Future.delayed(const Duration(milliseconds: 500));

      await getCart();
    } catch (e) {
      if (!isClosed) emit(CartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> updateCartItem({
    required int itemId,
    required int quantity,
  }) async {
    if (!isClosed) emit(CartLoadingState());

    try {
      await cartRepository.updateCartItem(itemId: itemId, quantity: quantity);

      // 🧠 Update local cartModel directly instead of re-fetching all
      final itemIndex = cartModel?.items.indexWhere((e) => e.dishId == itemId);
      if (itemIndex != null && itemIndex != -1) {
        cartModel!.items[itemIndex] = cartModel!.items[itemIndex].copyWith(
          quantity: quantity,
        );
      }

      emit(CartSuccessState());
    } catch (e) {
      if (!isClosed) emit(CartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> deleteCartItem(int itemId) async {
    emit(CartLoadingState());
    try {
      await cartRepository.deleteCartItem(itemId);
      // Refresh cart after deletion
      await getCart();
    } catch (e) {
      if (!isClosed) emit(CartFailureState(errorMessage: e.toString()));
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
