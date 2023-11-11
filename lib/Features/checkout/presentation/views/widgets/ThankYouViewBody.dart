import 'package:flutter/material.dart';
import 'ThankYouCard.dart';
import 'custom_check_icon.dart';
import 'custom_dashed_line.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Stack(clipBehavior: Clip.none, children: [
        const ThankaYouCard(),
        Positioned(
          bottom:
              MediaQuery.sizeOf(context).height * .2 + 20 //radius of avatar,
          ,
          left: 20 + 8, //to determine width of row
          right: 20 + 8,
          child: const CustomDashedLine(),
        ),
        Positioned(
          left: -20, //out
          bottom: MediaQuery.sizeOf(context).height * .2,
          child: const CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          right: -20, //out
          bottom: MediaQuery.sizeOf(context).height * .2,
          child: const CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        const CustomCheckIcon(),
      ]),
    );
  }
}



