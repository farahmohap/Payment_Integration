import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/Features/checkout/data/models/repos/checkout_repo.dart';
import 'package:payment_integration/Features/checkout/presentation/views/manager/payment/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());
    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold((l) => emit(PaymentFailure(l.toString())),
        (r) => emit(PaymentSuccess()));

    onChange(Change<PaymentState> change) {
      log(change.toString());
      super.onChange(change);
    }
  }
}
