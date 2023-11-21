import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.onTap, required this.text, this.isLoading=false});
  final void Function()? onTap;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: const Color(0xff34a853),
        ),
        child: Center(
          child:isLoading ?const Center(child:  CircularProgressIndicator()): Text(
            text,
            textAlign: TextAlign.center,
            style: Styles.style22,
          ),
        ),
      ),
    );
  }
}
