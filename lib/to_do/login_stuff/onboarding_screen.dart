import 'package:flutter/material.dart';
import 'package:my_report/to_do/login_stuff/login_screen.dart';
import 'package:my_report/to_do/login_stuff/my_form.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/providers.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = ThemeProviders();
    return SafeArea(
      child: Scaffold(
        backgroundColor: provider.isDarkMode ? Colors.white : Colors.black,
        body: Column(
          children: [
            //  SizedBox(height: 10,),
            SizedBox(
              height: 15,
            ),
            Text(
                "Explore all the existing roles based on your\n"
                " interest and study major",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 300,
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return MyTextField();
                }));
              },
              child: Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),
            ),
            GestureDetector(
              onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return LoginScreen();
      }));
              },
              child: Container(
                height: 50,
                width: 50,
                color: Colors.purple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
