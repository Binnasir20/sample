import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileClass extends StatelessWidget {
  const ListTileClass({super.key, required this.myText, required this.myText1, required this.isTrue, required this.myBlue,
    required this.myColor, this.myColor1, });
  final String myText1;
  final String myText;
  final bool isTrue;
  final String myBlue;
  final Color myColor;
  final Color? myColor1;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListTile(
        titleAlignment: ListTileTitleAlignment.top,
        horizontalTitleGap: 4,
     contentPadding: EdgeInsets.symmetric(horizontal: 2,),
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Container(
            height: 40,
            width: 40,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle
            ),
            child: Center(
              child: Image.asset("assets/myImages/abdul2.png",
                fit: BoxFit.cover,),
            ),
          ),
        ),
        title: Text(myText1,style: TextStyle(
          color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold
        ),),
        subtitle: Text(myText,style: TextStyle(
            color: Colors.black.withOpacity(0.5),fontSize: 11,
            fontWeight: FontWeight.bold,
        ),),
        trailing: Container(
          height: 16,
          width: isTrue ? 32 : 60,
          decoration: BoxDecoration(
            color: myColor,
            borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
            child: isTrue ? Text(myBlue,
            style: TextStyle(
              color: myColor1 ,
              fontSize: 9
            ),
            ) : Text(myBlue,
              style: TextStyle(
                  color: myColor1,
                  fontSize: 9
              ),
            ) ,
          ),
        ),
      )
    );
  }
}
