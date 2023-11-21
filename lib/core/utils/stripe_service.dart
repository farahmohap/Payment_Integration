import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment_integration/core/utils/api_keys.dart';
import 'package:payment_integration/core/utils/api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();
  // 1 -paymentIntentObject create payment intent (req amount,req currency)
  Future<PaymentIntentModel> createpaymentIntentModel(
      PaymentIntentInputModel paymentIntentInputModel) async {
//api request
    var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.secretKey);

    var paymentIntentmModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentmModel;
  }

//2 - init payment sheet(paymentIntentClientSecret)

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: "Farah" //اسم صاحب البيزنس
            ));
  }
//3-present paymentsheet()

  Future displayPaymentSheet() async {
    await Stripe.instance.presentCustomerSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel =
        await createpaymentIntentModel(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);

    await displayPaymentSheet();
  }
}
