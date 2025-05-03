import 'package:flutter/material.dart';

class ThemeProviders extends ChangeNotifier{
  bool isDarkMode = false;

  void toggleTheme(){
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}

class SettingProviders extends ChangeNotifier{
  //Full name validator
  validator(String value, String message){
    if(value.isEmpty){
      return message;
    }else if(value.length < 4){
      return "Name can't be less than 4";
    }else{
      return null;
    }
  }
  emailValidator(String value, String message){

    if(value.isEmpty){
      return message;
    }else if(value.length < 5){
      return "Email can't be less than 5";
    }else if(!value.contains( "@.")){
      return "Valid email is expected";
    }else{
      return null;
    }
  }
  passwordValidator(value, String message,){
    if(value.isEmpty){
      return message;
    }else if(value.length < 5){
    return 'Password must be at least six';
    }else{
      return null;
    }
  }


}
