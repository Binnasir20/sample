import 'package:flutter/material.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  List<String> myList = ["Today", "This Week", "This Month"];
  int selectedIndex = 0; // Track the selected index

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Employee Attendance",
            style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,


              children: [
                for (int i = 0; i < myList.length; i++)
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = i; // Update the selected index
                      });
                    },
                    child: Container( // Container for background color
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Add padding
                      decoration: BoxDecoration(
                        color: selectedIndex == i ? Colors.grey.shade200 : Colors.transparent, // Highlight selected
                       border: Border.all(
                         color:selectedIndex == i ? Colors.grey.shade200 : Colors.transparent
                       )
                      ),
                      child: Text(
                        myList[i],
                        style: TextStyle(
                          fontWeight: selectedIndex == i ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}