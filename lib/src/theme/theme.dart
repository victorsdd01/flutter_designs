

import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier{

  // bool _lightTheme = false;
  bool _darkTheme = false;
  ThemeData _currentTheme = ThemeData.light();


  // getters

  // bool get lightTheme => _lightTheme;

  bool get darkTheme => _darkTheme;

  ThemeData get  currentTheme => _currentTheme;

  // setters

  // set lightTheme(bool value){
  //   _lightTheme = value;
  //   notifyListeners();
  // }
  set darkTheme(bool value){
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme =  ThemeData.light();
    }

    notifyListeners();
  }

}