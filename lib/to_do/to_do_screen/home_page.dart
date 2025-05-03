import 'package:flutter/material.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/home_custom_classes/filtering_page.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/home_custom_classes/floatingButtonPage.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/home_custom_classes/status_card.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/home_custom_classes/status_card2.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/home_custom_classes/task_model.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/home_custom_classes/text_class.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/providers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key, required this.myName});
   String myName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController newDespController = TextEditingController();
  final TextEditingController newTaskController = TextEditingController();
  final List<String> progressStatus = ["My Tasks", "In-progress", "Completed"];
  static List<String> myTasks = ['Coding', 'Football', 'Reading',"Tourism","Town Hall"];
  static List<String> myDescrip = ['Getting better through learning how to Code',
    "Football fosters a good relationship",
    'Stay composed during reading',
    "Exploring new experiences through trying new adventures", "For accountability and transparency"];
  final List<TaskModel> newTask = List.generate(myTasks.length, (index)=> TaskModel(taskName: myTasks[index],
      taskDescription: myDescrip[index]));
  int index = 0;
  void isIndex(int i){
    setState(() {
      index = i;
    });
  }
  @override
  void dispose() {
    newTaskController.dispose();
    newDespController.dispose();
    super.dispose();
  }
  List<TaskModel> get filteredTasks {
    if (index == 0) return newTask; // All
    if (index == 1) return newTask.where((t) => !t.isCompleted).toList(); // In-progress
    return newTask.where((t) => t.isCompleted).toList(); // Completed
  }
   void deleteMethod(TaskModel item){
    setState(() {
      newTask.remove(item);
    });
   }
   //Search Control
  final searchController = TextEditingController();
  List<TaskModel> myEmptyList = [];
  bool isSearching = false;
  void filterTasksByKeyword(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        isSearching = false;
        myEmptyList = [];
      } else {
        isSearching = true;
        myEmptyList = newTask
            .where((task) =>
        task.taskName.toLowerCase().contains(keyword.toLowerCase()) ||
            task.taskDescription.toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      }
    });
  }
  double xPosition = 300; // Initial horizontal position
  double yPosition = 500;// Initial vertical position

  //Profile update
  final nameController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProviders>(context).isDarkMode;

    return Scaffold(
      body: Stack(
        children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
        ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.teal.shade900 : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(onPressed: (){
                  Provider.of<ThemeProviders>(context, listen: false).toggleTheme();
                }, icon: MyTextClass(myText: "Switch",
                    fontSize: 12,
    myColor: isDarkMode ? Colors.white : Colors.black, fontWeight:  FontWeight.bold)
               ),
                SizedBox(height: 6,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Center(
                          child: GestureDetector(
                            onTap: (){
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                 title: Text("Update Profile",style: TextStyle(
                                   color: Colors.black
                                 ),),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Profile picture?",style: TextStyle(
                                        color: Colors.black
                                      ),),
                                      SizedBox(height: 30,),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.pop(context);
                                          showDialog(context: context, builder: (context){
                                            return AlertDialog(
                                              backgroundColor: Colors.white,
                                              title: Text("Update profile name",style: TextStyle(
                                                color: Colors.black
                                              ),),
                                               content: TextField(
                                                 style: TextStyle(
                                                   color: Colors.black
                                                 ),
                                                 controller: nameController,
                                                 decoration: InputDecoration(
                                                   focusedBorder: OutlineInputBorder(),
                                                   hintText: "Change profile name",
                                                   hintStyle: TextStyle(color: Colors.black.withOpacity(0.5),fontSize: 11),
                                                   enabledBorder: OutlineInputBorder()
                                                 ),
                                               ),
                                              actions: [
                                                TextButton(onPressed: (){
                                                  setState(() {
                                                    if(nameController.text.isNotEmpty){
                                                      widget.myName = nameController.text.trim();
                                                      nameController.clear();
                                                      Navigator.pop(context);
                                                    }else{
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          content: Text('Name cannot be empty!'),
                                                          backgroundColor: Colors.red,
                                                        ),
                                                      );
                                                    }
                                                  });
                                                }, child: Text("save",style: TextStyle(
                                                  color: Colors.black
                                                ),))
                                              ],

                                            );
                                          });
                                        },
                                        child: Text("Profile name?",style: TextStyle(
                                            color: Colors.black
                                        ),),
                                      )
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel",style: TextStyle(
                                        color: Colors.black
                                      ),),
                                    ),
                                  ],
                                );
                              });
                            },
                            child: Image.asset("assets/myImages/abdul2.png",
                              fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Good Evening!",style: TextStyle(
                              color: isDarkMode ?  Colors.white.withOpacity(0.5) : Colors.black,
                              fontSize: 12,
                            ),),
                            Row(
                              children: [
                                Text(widget.myName,style: TextStyle(
                                  color: isDarkMode ? Colors.white :  Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),),
                                SizedBox(width: 5,),
                                Image.asset("assets/myImages/hi.jpeg",fit: BoxFit.cover,cacheHeight: 13,),


                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return  AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text("Search task",style: TextStyle(
                                  color: Colors.black
                                ),),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Text("Are you sure you want to delete ${newTask[index].taskName}?",
                                    //   style: TextStyle(
                                    //       color: Colors.black,
                                    //       fontSize: 12,
                                    //       fontWeight: FontWeight.bold
                                    //   ),)
                                    SizedBox(
                                      height: 40,
                                      child: TextField(
                                        controller: searchController,
                                        onChanged: filterTasksByKeyword,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12
                                        ),
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(
                                              color: Colors.teal.shade900
                                            )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(12),
                                              borderSide: BorderSide(
                                                  color: Colors.teal
                                              )
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                actions: [
                                  GestureDetector(
                                      onTap: (){
                                        setState(() {

                                        });
                                        Navigator.pop(context);
                                        searchController.clear();
                                      },
                                      child: Text("cancel",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                          )
                                      )),
                                  SizedBox(width: 20,),
                                  GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => FilteringPage(tasks: myEmptyList),
                                          ),
                                        );
                                        searchController.clear();
                                      },
                                      child: Text("Search",
                                          style: TextStyle(
                                            color: Colors.teal.shade900,
                                            fontSize: 11,
                                          )
                                      ))
                                ],
                              );
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: isDarkMode ? Colors.white.withOpacity(0.5) :  Colors.black
                                )
                            ),
                            child: Center(child: Icon(Icons.search,color: isDarkMode ? Colors.white :  Colors.black,size: 15,)),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color:isDarkMode ? Colors.white.withOpacity(0.5) :  Colors.black
                              )
                          ),
                          child: Center(
                            child: Icon(Icons.notifications_active_outlined,
                              color: isDarkMode ? Colors.white :  Colors.black,size: 15,),
                          ),
                        )
                      ],
                    )
                  ],
                ),

              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
             bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              height: MediaQuery.of(context).size.height-150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white : Colors.teal.shade900,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(progressStatus.length, (i) {
                        final isSelected = index == i;
                        return GestureDetector(
                          onTap: () => isIndex(i),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: 30,
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.teal.shade900 : Colors.white,
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                progressStatus[i],
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),

                    SizedBox(height: 10,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          StatusCard(
                          ),
                          StatusCard(
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    // My tasks
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       MyTextClass(myText: "Today Tasks",
                           fontSize: 17, myColor: isDarkMode ?Colors.black : Colors.white,
                           fontWeight: FontWeight.bold),
                        IconButton(onPressed: (){},
                            icon: Icon(Icons.arrow_forward_ios_rounded,
                              color: isDarkMode ?Colors.black : Colors.white,size: 18,))
                      ],
                    ),
                     SizedBox(
                       height: 400,
                       child: ListView.builder(
                           padding: EdgeInsets.symmetric(vertical: 3),
                           itemCount:filteredTasks.length,
                           itemBuilder: (context, index){
                           final task = filteredTasks[index];
                             return StatusCard2(taskName: newTask[index].taskName,
                                 description: newTask[index].taskDescription,
                             onTap: (){
                              showDialog(context: context, builder: (context){
                                return  AlertDialog(
                                  backgroundColor: Colors.white,
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Are you sure you want to delete ${newTask[index].taskName}?",
                                        style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold
                                      ),)
                                    ],
                                  ),
                                  actions: [
                                    GestureDetector(
                                        onTap: (){
                                          setState(() {

                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text("No",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 11,
                                            )
                                        )),
                                    SizedBox(width: 20,),
                                    GestureDetector(
                                        onTap: (){
                                          deleteMethod(task);
                                          Navigator.pop(context);
                                        },
                                        child: Text("Yes",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 11,
                                            )
                                        ))
                                  ],
                                );
                              });


                             },
                             );
                           }),
                     )
                  ],
                ),
              ),
            ),
          ),
          // Inside your Stack
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.elasticOut,
            left: xPosition,
            top: yPosition,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  xPosition += details.delta.dx;
                  yPosition += details.delta.dy;
                });
              },
              child: ButtonFlot(
                validator: (value) {},
                newDespController: newDespController,
                newTaskController: newTaskController,
                onPressed2: () {
                  if (newTaskController.text.isNotEmpty &&
                      newDespController.text.isNotEmpty) {
                    setState(() {
                      newTask.add(TaskModel(
                          taskName: newTaskController.text.trim(),
                          taskDescription: newDespController.text.trim()));
                    });
                    newTaskController.clear();
                    newDespController.clear();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
