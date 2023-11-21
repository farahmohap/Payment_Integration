import 'package:dartz/dartz.dart';
import 'package:payment_integration/Features/checkout/data/models/payment_intent_input_model.dart';

import '../../../../../core/utils/Errors/failures.dart';

abstract class CheckoutRepo {
  //Left ->Failure ,Right ->Success
  Future<Either<Failure, void>> makePayment({required PaymentIntentInputModel paymentIntentInputModel});
}

