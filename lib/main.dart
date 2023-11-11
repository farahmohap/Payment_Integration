import 'package:flutter/material.dart';
import 'package:payment_integration/Features/checkout/presentation/views/My_Cart_View.dart';

void main() {
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyCartView() ,);
  }
}
