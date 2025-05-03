import 'package:flutter/material.dart';
import 'package:my_report/my_iTreport/custom_folders/stack_container.dart';

class EnrollmentPage extends StatefulWidget {
  const EnrollmentPage({super.key});

  @override
  State<EnrollmentPage> createState() => _EnrollmentPageState();
}

class _EnrollmentPageState extends State<EnrollmentPage> {
  List<String> rate = ['100', '80', '60', '40', '20', '0'];
  List<String> month = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN'];
  List<String> typeList = ['Product', 'Marketing', 'Sales', 'Engineering'];
  List<Color> barColors = [
    Colors.orange,
    Colors.redAccent,
    Colors.blue[300]!,
    Colors.blue,
  ]; // Colors from StackContainer

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Enrollment Analytics",
            style: TextStyle(color: Colors.black, fontSize: 13,
            fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 10),
          //Date Container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Time Provider",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "January - June",
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    )
                  ],
                ),
                Image.asset(
                  'assets/myImages/down.png',
                  height: 15,
                  color: Colors.black54,
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  for (int i = 0; i < rate.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1.0, vertical: 8),
                      child: Text(
                        rate[i],
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 11),
                      ),
                    )
                ],
              ),
              StackContainer(sizeRate: 180, month: 'JAN'),
              StackContainer(sizeRate: 180, month: 'FEB'),
              StackContainer(sizeRate: 180, month: 'MAR'),
              StackContainer(sizeRate: 180, month: 'APR'),
              StackContainer(sizeRate: 180, month: 'JUN'),
              StackContainer(sizeRate: 180, month: 'JUL'),
            ],
          ),
          const SizedBox(height: 15),
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < typeList.length; i++)
                    Text(
                      typeList[i],
                      style: const TextStyle(fontSize: 11),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (int i = 0; i < typeList.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 15, top: 5),
                      child: Container(
                        height: 3,
                        width: 25,
                        color: barColors[i], // Use corresponding color
                      ),
                    )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}