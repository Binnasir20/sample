import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_report/to_do/login_stuff/my_form.dart';
import 'package:my_report/to_do/login_stuff/text_page.dart';
import 'package:my_report/to_do/login_stuff/userInput.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/providers.dart';
import 'package:my_report/to_do/to_do_screen/home_page.dart';
import 'button_class.dart';
import 'list_link.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController loginEmail = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();

  @override
  void dispose() {
    loginEmail.dispose();
    loginPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProviders>(context, listen: false);
    final isDarkMode = Provider.of<ThemeProviders>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:12.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return MyTextField();
                        })),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.teal.shade700 : Colors.teal.shade900,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      IconButton(onPressed: (){
                        Provider.of<ThemeProviders>(context,listen: false).toggleTheme();
                      }, icon: Text("Switch",
                        style: TextStyle(
                          fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black
                      ),))
          ]
                  ),
                ),
                Center(
                  child: TextPage(
                    myText: "TO-DO LIST",
                    fontSize: 25,
                    fontColor: isDarkMode ? Colors.teal.shade400 : Colors.teal.shade900,
                  ),
                ),
                const SizedBox(height: 35),
                 Center(
                   child: TextPage(
                      myText: "Login to your account",
                      fontSize: 18,
                      fontColor: isDarkMode ? Colors.white : Colors.black,
                    ),
                 ),

                const SizedBox(height: 50),
                Userinput(
                  prefixIcon: Icon(Icons.email,color: Colors.white,size: 18),
                  controller: loginEmail,
                  hintText: "Username/Email",
                  validator: (value) => provider.validator(value, "Enter your username"),
                ),
                const SizedBox(height: 20),
                Userinput(

                  obscure: true,
                  prefixIcon: Icon(Icons.lock,color: Colors.white,size: 18,),
                  controller: loginPassword,
                  hintText: "password",
                  validator: (value) => provider.passwordValidator(value, "Password is required"),
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.topRight,
                  child: TextPage(
                    myText: "Forgot password?",
                    fontSize: 11,
                    fontColor: isDarkMode ? Colors.grey.shade500 : Colors.grey,
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: ButtonClass(
                    buttonText: "Login",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePage(myName: loginEmail.text),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: TextPage(
                    myText: "-- Or Login with --",
                    fontSize: 14,
                    fontColor: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 40,),
                ListLink(),
                SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextPage(
                      myText: "Don't have an account?",
                      fontSize: 11,
                      fontColor: isDarkMode ? Colors.white : Colors.black,
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyTextField(),
                          ),
                        );
                      },
                      child: TextPage(
                        myText: "Sign up",
                        fontSize: 13,
                        fontColor: isDarkMode ? Colors.teal.shade400 : Colors.black,
                      ),
                    ),
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
