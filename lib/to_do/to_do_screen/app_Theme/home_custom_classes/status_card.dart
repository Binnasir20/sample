import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/providers.dart';
import 'package:provider/provider.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({super.key,});
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProviders>(context).isDarkMode;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        height: 110,
        width: 170,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 1
          ),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Office",
                      style: TextStyle(
                      color: Colors.deepPurpleAccent,
                        fontSize: 11,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
                SizedBox(width: 8,),
                Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Priority",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 11,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                )
              ],
            ),
            SizedBox(height: 5,),
            Text("Create a website\nfor car booking",style: TextStyle(
              color: isDarkMode ?Colors.black : Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 5,),
            Text("Mon, 12 July 2022",style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
              fontWeight: FontWeight.w500

            ),)
          ],
        ),
      ),
    );
  }
}
