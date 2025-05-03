import 'package:flutter/material.dart';
import 'package:my_report/to_do/login_stuff/text_class.dart';
import 'package:my_report/to_do/login_stuff/text_page.dart';

import 'list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextPage(myText: 'Chats', fontSize: 30,
                      fontColor: Colors.black,fontWeight: FontWeight.normal,
                    ),
                    GestureDetector(
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)
                        ),
                      ),
                    )
                  ],
                ),
                //Filtering Container
                SizedBox(height: 15,),
                SizedBox(
                  height: 40,
                  child:   TextField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12
                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                          color: Colors.black.withOpacity(0.5),size: 17,),
                        hintText: 'Search',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5)
                            )
                        ),
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5)
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5)
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.5)
                            )

                        )
                    ),

                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(
                          color: Colors.blue,shape: BoxShape.circle
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.movie_filter_sharp,color: Colors.black,size: 18,),
                    SizedBox(width: 4,),
                    TextPage(myText: "Ibiza 2025", fontSize: 14,
                      fontColor: Colors.black,fontWeight: FontWeight.bold,),
                  ],
                ),
                SizedBox(height: 15,),
                ListTileClass(myText: "Long time no see! I've been thinking it\n"
                    "would be great to catch up. How about we\n meet up this weekend?"
                    "I know this cozy is..",
                  myText1: "Ralph Edwards",
                  isTrue: true,
                  myBlue: "New",
                  myColor1: Colors.blue,
                  myColor:  Colors.blue.shade50
                  ,),
                SizedBox(height: 15,),
                ListTileClass(myText: "Hey! What's up? Fancy grabbing a drink a..",
                myText1: "Floyd Miles",
                  isTrue: false,
                  myBlue: "1 day ago",
                  myColor: Colors.transparent,
                  myColor1: Colors.black.withOpacity(0.5),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Icon(Icons.movie_filter_sharp,color: Colors.black,size: 18,),
                        SizedBox(width: 4,),
                        TextPage(myText: "School boys", fontSize: 14,
                          fontColor: Colors.black,fontWeight: FontWeight.bold,),
                      ],
                    ),
                    Icon(Icons.add,color: Colors.black,size: 18,)
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                              color: Colors.blue,shape: BoxShape.circle
                          ),
                        ),
                        SizedBox(width: 14,),
                        Icon(Icons.movie_filter_sharp,color: Colors.black,size: 18,),
                        SizedBox(width: 4,),
                        TextPage(myText: "All messages", fontSize: 14,
                          fontColor: Colors.black,fontWeight: FontWeight.bold,),
                      ],
                    ),
                    Icon(Icons.minimize,color: Colors.black,size: 18,)
                  ],
                ),
                SizedBox(height: 15,),
                ListTileClass(myText: "Yo, got any plans tonight? Let's hit that "
                    "new sushi placetown!",myText1: "Arlene McCoy",
                isTrue: false,
                  myBlue: "12 min ago",
                  myColor1: Colors.blue,
                  myColor:  Colors.blue.shade50,
                ),
                SizedBox(height: 15,),
                ListTileClass(myText: "Omg, just found a rooftop party for Friday...",
                myText1: "Mike Robertson",
                  myBlue: "1 day ago",
                  myColor: Colors.transparent,
                  isTrue: false,
                  myColor1: Colors.black.withOpacity(0.5),
                ),
                SizedBox(height: 15,),
                ListTileClass(myText: "Hey bestie, there's all TikTok meetup hupp...",
                  myText1: "Charlie Hawkins",isTrue: false,myBlue: "3 days ago",
                myColor: Colors.transparent,
                    myColor1: Colors.black.withOpacity(0.5)
                )

              ],
            ),
          )
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 10,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
        BottomNavigationBarItem(icon:
        Icon(Icons.indeterminate_check_box_outlined,color: Colors.black,),label: ''),
        BottomNavigationBarItem(icon:
        Icon(Icons.people_outline,color: Colors.black),label: ''),
        BottomNavigationBarItem(icon:
        Icon(Icons.person,color: Colors.black),label: '')
      ]),
    );
  }
}
