import 'package:flutter/material.dart';
import 'package:payment_integration/Features/checkout/presentation/views/widgets/paymentdetailsviewbody.dart';
import 'package:payment_integration/core/widgets/custom_appbar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Paymnet Details"),
      body: PaymentDetailsViewBody(),
    );
  }
}
