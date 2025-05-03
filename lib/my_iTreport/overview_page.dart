import 'package:flutter/material.dart';
import 'package:my_report/my_iTreport/custom_folders/employee_page.dart';
import 'package:my_report/my_iTreport/custom_folders/employees_card.dart';
import 'package:my_report/my_iTreport/custom_folders/enrollment_page.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 190,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    shape: BoxShape.circle
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset('assets/myImages/abdul2.png'),
                ),
              SizedBox(width: 7,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Good Morning!",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 11
                    ),
                  ),
                  Row(
                    children: [
                      Text("Bin Nasir",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 5,),
                      Image.asset('assets/myImages/hi.jpeg',height: 14,)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 14),
            child:
              Row(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 9),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1
                    ),
                  ),
                  child: Image.asset
                    ('assets/myImages/search.png',)
                ),
                SizedBox(width: 10,),
                Stack(
                  clipBehavior: Clip.none,
                  children:[
                    Container(
                      margin: EdgeInsets.only(top: 0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1
                        )
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/myImages/noti.png'),
                  ),
                    ),
                    Positioned(
                      right: -1,
                        top: -2,
                        child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red
                      ),
                    ))
    ]
                )
              ],
                  )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child:SingleChildScrollView(
          child:  Column(
            children: [
              SizedBox(height: 5,),
              //Employee card
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                Row(
                  children: [
                    EmployeesCard(myPic: 'assets/myImages/group.png',
                      myPicText: 'Total Employee', totalEmployee: '3571',
                      greenText: 'H%', date: 'March, 26 2025',),
                    EmployeesCard(myPic: 'assets/myImages/cardiology.png',
                        myPicText: 'Total Applicant',
                        totalEmployee: '2563', greenText: '4%', date:'March, 11 2025'),
                    EmployeesCard(myPic: 'assets/myImages/filter.png',
                        myPicText: 'Total Marketers',
                        totalEmployee: '4000', greenText: '4%', date:'March, 30 2025')


                  ],
                ),
              ),
              SizedBox(height: 20,),
              // Enrollment Container
              EnrollmentPage(),
              SizedBox(height: 20,),
              EmployeePage()
            ],
          ),
        ),
      ),
    );
  }
}
