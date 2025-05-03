import 'package:flutter/material.dart';

class MyTextClass extends StatelessWidget {
  const MyTextClass({super.key, required this.myText, required this.fontSize, required this.myColor, required this.fontWeight});
  final String myText;
  final double fontSize;
  final Color myColor;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(myText,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: myColor,
    ),
    );
  }
}
