import 'package:flutter/material.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/providers.dart';
import 'package:provider/provider.dart';

class ButtonFlot extends StatelessWidget {
  const ButtonFlot({super.key, required this.newTaskController,
    required this.newDespController, required this.onPressed2, required this.validator});
 final TextEditingController newTaskController;
 final TextEditingController newDespController;
 final VoidCallback onPressed2;
 final FormFieldValidator validator;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProviders>(context).isDarkMode;
    return  GestureDetector(
        onTap: (){
          print("Tapped");
          showDialog(context: context, builder: (context){
            return
              AlertDialog(
              backgroundColor: Colors.white,
              title: Text("New Task",style: TextStyle(color: Colors.black),),
              content:Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    validator: validator,
                    controller: newTaskController,
                    style: TextStyle(
                        color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                    decoration: InputDecoration(
                        hintText: "Add new task",
                        hintStyle: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 11
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.teal.shade900
                          )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    validator: validator,
                    textAlign: TextAlign.start,
                    cursorColor: Colors.black,
                    showCursor: true,
                    maxLines: 5,
                    enableInteractiveSelection: true,
                    controller: newDespController,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                    decoration: InputDecoration(
                       hintText: "Add description",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 11,
                          fontFamily: "Roboto",
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.teal.shade900
                          )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(onPressed:
                    (){ Navigator.pop(context);
                  newDespController.clear();
                  newTaskController.clear();
                  }, child: Text("Cancel",style: TextStyle(color: Colors.black))),
                TextButton(onPressed: onPressed2,
                    child: Text("Add",style: TextStyle(color: Colors.teal.shade900))),
              ],
            );
          });
        },
        child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: isDarkMode ? Colors.teal.shade900 : Colors.teal,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(Icons.add,color:
            isDarkMode ? Colors.white : Colors.black,size: 18,)),
    );
  }
}
