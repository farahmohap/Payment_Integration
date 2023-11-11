import 'package:flutter/material.dart';
import 'package:payment_integration/Features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodItemsList = [
    "assets/images/card.svg",
    "assets/images/paypal.svg",
    "assets/images/applapay.svg"
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      //horizontal Listview must have height
      child: ListView.builder(
          itemCount: paymentMethodItemsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  activeIndex == index;
                  setState(() {
                    
                  });
                },
                child: PaymentMethodItem(
                  isActive: activeIndex == index, //true
                  imagePath: paymentMethodItemsList[index],
                ),
              ),
            );
          }),
    );
  }
}
