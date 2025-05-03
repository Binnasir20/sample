import 'package:flutter/material.dart';

class ButtonClass extends StatelessWidget {
  const ButtonClass({super.key, required this.buttonText, required this.onTap});
  final String buttonText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width-100,
          decoration: BoxDecoration(
              color: Colors.teal[900],
              borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(buttonText, style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
    );
  }
}
