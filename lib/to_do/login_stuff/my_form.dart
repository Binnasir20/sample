

import 'package:flutter/material.dart';
import 'package:my_report/to_do/login_stuff/button_class.dart';
import 'package:my_report/to_do/login_stuff/list_link.dart';
import 'package:my_report/to_do/login_stuff/text_page.dart';
import 'package:my_report/to_do/login_stuff/userInput.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/providers.dart';
import 'package:my_report/to_do/to_do_screen/home_page.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';


class MyTextField extends StatefulWidget {
   const MyTextField({
    super.key,
  });



  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();


  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProviders>(context).isDarkMode;
    final provider = SettingProviders();
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context)..push(MaterialPageRoute(builder: (context){
                            return LoginScreen();
                          }));
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.teal.shade700 : Colors.teal.shade900,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                            )
                          ),
                          child: Center(
                            child: Icon(Icons.arrow_back_ios_new,
                              color: Colors.white,size: 15,),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      IconButton(onPressed: (){
                        Provider.of<ThemeProviders>(context,listen: false).toggleTheme();
                      }, icon: Text("Switch",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.black
                        ),))
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Center(
                  child: TextPage(myText: "Sign up to experience our service",
                      fontSize: 13, fontColor: isDarkMode ? Colors.white : Colors.black),
                ),
                SizedBox(height: 30,),
                Userinput(
                  prefixIcon: Icon(Icons.person,color: Colors.white,size: 18),
                hintText: 'Full Name',
                    textInputType: TextInputType.text,
                    controller: fullName,
                  validator: (value) => provider.validator(value, "Full name is required"),
                ),
                SizedBox(height: 15,),
                Userinput(
                  prefixIcon: Icon(Icons.email,color: Colors.white,size: 18),
                  controller: email,
               textInputType: TextInputType.emailAddress,
               hintText: "Email",
               validator: (value) => provider.emailValidator(value, "Email can't be empty"),
                ),
                SizedBox(height: 20,),
                Userinput(
                  obscure: true,
                  prefixIcon: Icon(Icons.lock,color: Colors.white,size: 18),
                  controller: password,
                 hintText: "password",
                 validator: (value) => provider.passwordValidator(value, "Password can't be empty",),
                ),
                SizedBox(height: 20,),
                Userinput(
                  obscure: true,
                    prefixIcon: Icon(Icons.lock,color: Colors.white,size: 18),
                    hintText: "Confirm password",controller: confirmPassword),
                SizedBox(height: 20,),
               Center(
                 child: ButtonClass(
                   buttonText: "Create Account", onTap: () {
                     if(_formKey.currentState!.validate()){
                       Navigator.of(context).push(MaterialPageRoute(builder: (context){
                         return HomePage(myName: fullName.text);
                       }));
                     }else{
                       return;
                     }
                 },
                 ),
               ),
                SizedBox(height: 30,),
                Center(
                  child: TextPage(myText: "-- Or Sign up with --",
                      fontSize: 13, fontColor: isDarkMode ? Colors.white : Colors.black),
                ),
                SizedBox(height: 20,),
                ListLink(),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextPage(myText: "Already hava an account?",
                      fontSize: 11,
                      fontColor: isDarkMode ? Colors.white : Colors.black,),
                    SizedBox(width: 10,),
                    GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return LoginScreen();
                          }));
                        },
                        child: TextPage(myText: "Log in", fontSize: 13,
                            fontColor: isDarkMode ? Colors.teal.shade400 : Colors.black))
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
