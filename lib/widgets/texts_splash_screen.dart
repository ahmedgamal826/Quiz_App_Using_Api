import 'package:flutter/material.dart';

class TextsSplashScreen extends StatelessWidget {
  const TextsSplashScreen(
      {super.key,
      required this.txt,
      required this.fontWeight,
      required this.fontSize});

  final String txt;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            txt,
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: fontWeight),
          ),
        ),
      ],
    );
  }
}
