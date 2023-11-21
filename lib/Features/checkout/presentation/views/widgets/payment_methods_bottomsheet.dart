import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_integration/Features/checkout/presentation/views/manager/payment/payment_cubit.dart';
import 'package:payment_integration/Features/checkout/presentation/views/thankyou_view.dart';
import 'package:payment_integration/Features/checkout/presentation/views/widgets/paymentmethodsListView.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../manager/payment/payment_state.dart';
import 'custom_button_bloc_consumer.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(),
          const SizedBox(
            height: 32,
          ),
        const  CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}

