import 'package:flutter/material.dart';

class TextClass extends StatelessWidget {
  const TextClass({super.key,
    required this.myAxis,
    required this.myText,
    required this.myColor});

  final MainAxisAlignment myAxis;
 final String myText;
 final Color myColor;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: myAxis,
      children: [
        Text(myText,
          style: TextStyle(
            color: myColor,
            fontWeight: FontWeight.w500,
            fontSize: 13,

          ),),
      ],
    );
  }
}
