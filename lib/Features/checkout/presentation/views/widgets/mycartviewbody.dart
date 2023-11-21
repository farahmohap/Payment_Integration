import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_integration/Features/checkout/data/models/repos/checkout_repo_impl.dart';
import 'package:payment_integration/Features/checkout/presentation/views/manager/payment/payment_cubit.dart';
import 'package:payment_integration/Features/checkout/presentation/views/widgets/payment_methods_bottomsheet.dart';
import 'package:payment_integration/Features/checkout/presentation/views/widgets/total_price.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'orderinfoitem.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Expanded(child: Image.asset("assets/images/basketball.png")),
          const OrderInfoItem(
            title: "Order Subtotal",
            value: r"42.97$",
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: "Discount",
            value: r"0$", //row string
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: "Shipping",
            value: r"8$",
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7c7),
          ),
          const TotalPrice(title: "Total Price", value: r"80$"),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: "Complete Payment",
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const PaymentDetailsView();
              // }));

              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  builder: (context) {
                    return BlocProvider(
                        create: (context)=>PaymentCubit(CheckoutRepoImp()),
                        child: const PaymentMethodsBottomSheet());
                  });
            },
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
