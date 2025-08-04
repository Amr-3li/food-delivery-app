import 'package:restaurant/features/cart/data/models/cart_model.dart';

class CartStates {}

class CartInitialState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {}

class CartFailureState extends CartStates {
  final String errorMessage;
  CartFailureState({required this.errorMessage});
}

class AddToCartSuccessState extends CartStates {}

class AddToCartFailureState extends CartStates {
  final String errorMessage;
  AddToCartFailureState({required this.errorMessage});
}

class UpdateCartSuccessState extends CartStates {}

class UpdateCartFailureState extends CartStates {
  final String errorMessage;
  UpdateCartFailureState({required this.errorMessage});
}

class DeleteCartSuccessState extends CartStates {}

class DeleteCartFailureState extends CartStates {
  final String errorMessage;
  DeleteCartFailureState({required this.errorMessage});
}

class EmptyCartSuccessState extends CartStates {}

class EmptyCartFailureState extends CartStates {
  final String errorMessage;
  EmptyCartFailureState({required this.errorMessage});
}