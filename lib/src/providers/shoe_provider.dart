

import 'package:flutter/material.dart';

class ShoeProvider extends ChangeNotifier{

  int _selectedShoeSize = 0;
  String _currentColor = 'azul';

  // getters

  int get selectedShoeSize => _selectedShoeSize;
  String get currentColor => _currentColor;


  // setters

  set selectedShoeSize ( int value ){
    _selectedShoeSize =  value;
    notifyListeners();
  } 

  set currentColor(String value){
    _currentColor = value;
    notifyListeners();
  }

}