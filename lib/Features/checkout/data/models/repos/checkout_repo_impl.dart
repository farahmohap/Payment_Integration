import 'package:dartz/dartz.dart';
import 'package:payment_integration/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/core/utils/Errors/failures.dart';
import 'package:payment_integration/core/utils/stripe_service.dart';

import 'checkout_repo.dart';

class CheckoutRepoImp extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
