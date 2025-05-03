import 'package:flutter/material.dart';

class StackContainer extends StatelessWidget {
  const StackContainer({super.key, required this.sizeRate, required this.month, });
  final double sizeRate;
  final String month;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
                height: 180,
                width: 15,
                color: Colors.black,
              ),

            Positioned(
            bottom:  (sizeRate / 180) * 60,
              child: Container(
                height: (sizeRate / 180) * 120,
                width: 15,
                color: Colors.green,
              ),
            ),
           Positioned(

             bottom: (sizeRate / 180) * 40,
             child:  Container(
             height: (sizeRate / 180) * 75,
             width: 15,
             color: Colors.orange,
           ),),
            Positioned(
              bottom: (sizeRate / 180) * 20,
              child: Container(
                height: (sizeRate / 180) * 45,
                width: 15,
                color: Colors.blue[300],
              ),
            ),
            Positioned(
              bottom:  (sizeRate / 100) * 0,
              child: Container(
                height:(sizeRate / 180) * 25,
                width: 15,
                color: Colors.red,
              ),
            )
          ],
        ),
      SizedBox(height: 5,),
      Text(month, style: TextStyle(
        fontSize: 9,
        color: Colors.grey
      ),),
      ],
      
    );
  }
}
