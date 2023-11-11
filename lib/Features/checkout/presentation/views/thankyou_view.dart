import 'package:flutter/material.dart';
import 'package:payment_integration/Features/checkout/presentation/views/widgets/ThankYouViewBody.dart';
import 'package:payment_integration/core/widgets/custom_appbar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: buildAppBar(),
      body: ThankYouViewBody());
  }
}
