import 'package:flutter/material.dart';

class EmployeesCard extends StatelessWidget {
  const EmployeesCard({super.key,
    required this.myPic,
    required this.myPicText,
    required this.totalEmployee,
    required this.greenText,
    required this.date});
  final String myPic;
  final String myPicText;
  final String totalEmployee;
  final String greenText;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13,vertical: 10),
        height: 120,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white
        ),
        child: Column(
          children: [
            SizedBox(height: 5,),
            Row(
              children: [
                Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Center(child: Image.asset(myPic,color: Colors.blue,cacheHeight: 11,)),
      ),
        SizedBox(width: 10,),
                    Text(myPicText,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                    ),)
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(totalEmployee, style: TextStyle(
                    color: Colors.black,

                    fontSize: 18,
                  ),),
                SizedBox(width: 10,),
                Container(
                  height: 20,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green[100],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(".",
                        style: TextStyle(
                          fontSize: 16,
                     fontWeight: FontWeight.bold,
                          color: Colors.green
                        ),
                        ),
                        Text(greenText,
                          style: TextStyle(
                              fontSize: 12,

                              color: Colors.green
                          ),
                        )
                      ],
                    )
                  ),
                ),
              ],
            ),
              // Dot line
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(int i = 0; i < 20; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Container(
                        height: 1,
                        width: 3,
                        color: Colors.black26,
                      ),
                    )
                  ],
                ),
              ),
            SizedBox(height: 7,),
            Text("Update: $date",
            style: TextStyle(
              fontSize: 11,

              color: Colors.black54
            ),
            )
          ],
        ),
      ),
    );
  }
}
