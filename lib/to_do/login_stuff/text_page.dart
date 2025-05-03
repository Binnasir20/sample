import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key, required this.myText, required this.fontSize, required this.fontColor, this.fontWeight});
  final String myText;
  final double fontSize;
  final Color fontColor;
  final FontWeight? fontWeight;


  @override
  Widget build(BuildContext context) {
    return Text(myText,
      style: TextStyle(
          color:fontColor,
          fontWeight: fontWeight,
          fontSize: fontSize
      ),
    );
  }
}
