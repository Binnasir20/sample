import 'package:flutter/material.dart';
import 'package:my_report/my_iTreport/Inbox_pages.dart';
import 'package:my_report/my_iTreport/analytics_page.dart';
import 'package:my_report/my_iTreport/candidates_page.dart';

import 'overview_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int myPages = 0;
  List<Widget> myList = [
    OverviewPage(),
    CandidatesPage(),
    AnalyticsPage(),
    InboxPages(),
    InboxPages2()
  ];
   double size = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myList[myPages],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myPages,
        onTap: (index) {
          setState(() {
            myPages = index;
          });
        },
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: size,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Candidates',),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Inbox'),
          BottomNavigationBarItem(icon: Icon(Icons.devices_other_sharp), label: 'Others'),
        ],
      ),
    );
  }
}
