

import 'package:flutter/material.dart';

class PinteresProvider extends ChangeNotifier{

  int _selectedButton = 0;


  // getters 

  int get selectedButton => _selectedButton;

  // setters

  set selectedButton(int value){
    _selectedButton = value;
    notifyListeners();
  }



}