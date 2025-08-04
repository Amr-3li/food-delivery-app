import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/cart/data/models/cart_model.dart';
import 'package:restaurant/features/cart/data/repository/cart_repository.dart';
import 'package:restaurant/features/cart/presentation/cubit/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  final CartRepository cartRepository;

  CartCubit({required this.cartRepository}) : super(CartInitialState());

  CartModel? cartModel;

  Future<void> getCart() async {
    try {
      final CartModel cart = await cartRepository.getCart();
      if (cart.data != null) {
        cartModel = cart;
        emit(CartSuccessState());
      }
    } catch (e) {
      emit(CartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> addToCart({required int dishId, required double price}) async {
    emit(CartLoadingState());

    try {
      await cartRepository.addToCart(dishId: dishId, price: price);
      await getCart();
      emit(AddToCartSuccessState());
    } catch (e) {
      emit(AddToCartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> updateCartItem({
    required int itemId,
    required int quantity,
  }) async {
    emit(CartLoadingState());

    try {
      await cartRepository.updateCartItem(itemId: itemId, quantity: quantity);
      getCart();
      emit(UpdateCartSuccessState());
    } catch (e) {
      emit(UpdateCartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> deleteCartItem(int itemId) async {
    emit(CartLoadingState());
    try {
      await cartRepository.deleteCartItem(itemId);
      await getCart();
      emit(DeleteCartSuccessState());
    } catch (e) {
     emit(DeleteCartFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> clearCart() async {
    emit(CartLoadingState());
    try {
      await cartRepository.clearCart();
      await getCart();
      emit(EmptyCartSuccessState());
    } catch (e) {
      emit(EmptyCartFailureState(errorMessage: e.toString()));
    }
  }
}
