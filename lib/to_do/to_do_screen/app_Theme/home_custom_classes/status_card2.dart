import 'package:flutter/material.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/providers.dart';
import 'package:provider/provider.dart';

class StatusCard2 extends StatelessWidget {
  const StatusCard2({super.key, required this.taskName, required this.description, required this.onTap});
  final String taskName;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProviders>(context).isDarkMode;
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Colors.grey.withOpacity(0.5)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(taskName, style: TextStyle(
                    color:isDarkMode ?Colors.black : Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                ),),
                GestureDetector(
                  onTap: onTap,
                  child: Icon(Icons.clear, color:
                  isDarkMode ?Colors.black : Colors.white, size: 18,),
                ),
              ],
            ),
            SizedBox(height: 2,),
            Text(description, style: TextStyle(
              color: isDarkMode ? Colors.black.withOpacity(0.5) : Colors.white,
              fontSize: 11,
              overflow: TextOverflow.ellipsis
            ),),
            SizedBox(height: 2,),
            Text("10:00 - 11:00", style: TextStyle(
              color: isDarkMode ? Colors.black.withOpacity(0.5): Colors.white,
              fontSize: 11,

            ),)
          ],
        ),
      ),
    );
  }
}
