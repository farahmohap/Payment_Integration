import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Stripe_Integration/payment_manager.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/payment_intent_input_model.dart';
import '../manager/payment/payment_cubit.dart';
import '../manager/payment/payment_state.dart';
import '../thankyou_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(listener: (context, state) {
      if (state is PaymentSuccess) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const ThankYouView();
        }));
      }
      if (state is PaymentFailure) {
        Navigator.of(context).pop();
        SnackBar snackBar = SnackBar(content: Text(state.errMessage));
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar);
      }
    }, builder: (context, state) {
      return CustomButton(
          //trigger
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(amount: "100", currency: "USD");
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);

          // PaymentManager.makePayment( amount:100,currency: "EGP");  
             
          },
          isLoading: state is PaymentLoading ? true : false,
          text: "Continue");
    });
  }
}
