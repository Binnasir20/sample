import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_report/assignment/home_screen.dart';
import 'package:my_report/to_do/login_stuff/login_screen.dart';
import 'package:my_report/to_do/login_stuff/onboarding_screen.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/app_behaviour.dart';
import 'package:my_report/to_do/to_do_screen/app_Theme/providers.dart';
import 'package:provider/provider.dart';

import 'my_iTreport/FirstPage.dart';

void main() {
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create:
          (context) => ThemeProviders()),
      ChangeNotifierProvider(create:
          (context) => SettingProviders())
    ],
    child: MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return Consumer<ThemeProviders>(
      builder: (context, themeProviders,child) {
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeProviders.isDarkMode ? ThemeMode.light : ThemeMode.dark,
          theme: AppTheme.darkTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        );
      }
    );
  }
}

