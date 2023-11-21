import 'package:flutter/material.dart';
import 'package:payment_integration/Stripe_Integration/payment_manager.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: Column(children: [
      MaterialButton(onPressed: (){
PaymentManager.makePayment( amount:100,currency: "EGP");

      },child:const Text("Pay"),)]),
    
    );
  }
}