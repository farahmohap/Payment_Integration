import 'package:flutter/material.dart';
import 'package:payment_integration/Features/checkout/presentation/views/widgets/mycartviewbody.dart';
import '../../../../core/widgets/custom_appbar.dart';
class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: "My Cart"),
      body:const MyCartViewBody(),
    );
  }
}
