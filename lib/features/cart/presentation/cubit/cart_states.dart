import 'package:restaurant/features/cart/data/models/cart_model.dart';

class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {
  final CartModel cartModel;
  CartSuccessState({required this.cartModel});
}

class CartFailureState extends CartStates {
  final String errorMessage;
  CartFailureState({required this.errorMessage});
}
