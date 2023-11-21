import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/core/utils/api_keys.dart';

abstract class PaymentManager {
  static Future<void> makePayment(
      {required int amount, required String currency}) async {
    //payment intent to get clinetsecret

    try {
      String clientSecret = await getClientSecret(
          amount: (amount * 100).toString(), currency: currency);
      await initPaymentSheet(paymentIntentClientSecret: clientSecret);
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentClientSecret,
            merchantDisplayName: "Farah" //اسم صاحب البيزنس
            ));
  }

  static Future<String> getClientSecret(
      {required String amount, required String currency}) async {
    Dio dio = Dio();
    var response = await dio.post("https://api.stripe.com/v1/payment_intents",
        options: Options(headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        }),
        data: {'amount': amount, 'currency': currency});
    return response.data['client_secret'];
  }
}
