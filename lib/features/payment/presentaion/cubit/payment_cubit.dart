import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/payment/data/repository/payment_repository.dart';
import 'package:restaurant/features/payment/presentaion/cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepository paymentRepository;
  PaymentCubit(this.paymentRepository) : super(PaymentInitial());

  Future<void> makePayment({
    required double amount,
    required String currency,
  }) async {
    emit(PaymentLoading());

    final result = await paymentRepository.processPayment(
      amount: amount,
      currency: currency,
    );

    result.fold((failure) => emit(PaymentFailure(failure)), (_) async {
      emit(PaymentSucess());
    });
  }
}
