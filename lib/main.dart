import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_integration/Features/checkout/presentation/views/My_Cart_View.dart';
import 'package:payment_integration/core/utils/api_keys.dart';

import 'Stripe_Integration/test_screen.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey; 
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

 @override
  Widget build(BuildContext context) {
    return const MaterialApp(  
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
      //home: Test(),
    );
  }
}

//paymentIntentObject create payment intent (req amount,req currency,customerId)
//KeySecret           create EphemeralKey(customerId)
//init paymentSheet(paymentIntentClientSecret(merchantname,intentclientsecret,ephemeralkey))
//present paymentsheet()

// Future<void> initPaymentSheet() async {
//   try {
//     // 1. create payment intent on the server
//     //final data = await _createTestPaymentSheet();

//     // 2. initialize the payment sheet
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         // Main params
//         merchantDisplayName: 'Flutter Stripe Store Demo',
//         paymentIntentClientSecret: data['paymentIntent'],
//       ),
//     );
//     setState(() {
//       _ready = true;
//     });
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error: $e')),
//     );
//     rethrow;
//   }
// }
