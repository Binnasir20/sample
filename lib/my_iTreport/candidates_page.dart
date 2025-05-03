import 'package:flutter/material.dart';

class CandidatesPage extends StatefulWidget {
  const CandidatesPage({super.key});

  @override
  State<CandidatesPage> createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<CandidatesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.white,
              child:
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Candidates",
                   style: TextStyle(
                       color: Colors.black,
                       fontSize: 20,
                       fontWeight: FontWeight.bold
                   ),
                 ),
                 SizedBox(height: 10),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     SizedBox(
                       height: 40,
                       width: 280,
                       child: TextField(
                         decoration: InputDecoration(
                           filled: true,
                           border: InputBorder.none
                         ),
                         clipBehavior: Clip.antiAlias,

                       ),
                     ),
                     Container(
                       height: 40,
                       width: 40,
                       decoration: BoxDecoration(
                         border: Border.all(
                           color: Colors.grey.withOpacity(0.5)
                         ),
                         borderRadius: BorderRadius.circular(6)
                       ),
                       child: Center(
                         child: Icon(Icons.filter_list_outlined),
                       ),
                     )
                   ],
                 )
               ],
             )
            ),
          ]
        ),
      ),
    );
  }
}
