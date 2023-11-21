import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:payment_integration/Features/checkout/presentation/views/widgets/paymentmethodsListView.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../thankyou_view.dart';
import 'custom_credit_card.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(child: PaymentMethodsListView()),
      SliverToBoxAdapter(
          child: CustomCreditCard(
        autovalidateMode: autovalidateMode,
        formKey: formKey,
      )),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0, left: 16, right: 16),
            child: CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save(); //save data
                  log('Payment');
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) {
                    return const ThankYouView();
                  }));
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: "Pay",
            ),
          ),
        ),
      ),
    ]);
  }
}
