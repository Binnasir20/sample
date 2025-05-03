import 'package:flutter/material.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/home_custom_classes/status_card2.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/home_custom_classes/task_model.dart';

class FilteringPage extends StatelessWidget {
  const FilteringPage({super.key, required this.tasks});
  final List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: tasks.isNotEmpty ? AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Text("Back",style: TextStyle(
            color: Colors.black
          ),))
        ],
        leadingWidth: 150,
        leading:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 15,),
            Text("Available task",
              style: TextStyle(
                  color: Colors.black,
                fontSize: 17,
              ),),
          ],
        ),
      ) : null,
      body: tasks.isEmpty
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('No results found.',style: TextStyle(
                      color: Colors.black
                    ),)),
              SizedBox(height: 10,),
              TextButton(onPressed: (){
                Navigator.pop(context);

              }, child: Text("Back",style: TextStyle(
                color: Colors.black
              ),))
            ],
          )
          : ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemCount: tasks.length,
        itemBuilder: (context, i) {
          final t = tasks[i];
          return SingleChildScrollView(
            child: Column(
              children: [
                StatusCard2(
                  taskName: t.taskName,
                  description: t.taskDescription,
                  onTap: () {
                    // If you want deletion here:
                    // you could pop back and call deleteMethod, or implement locally
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
