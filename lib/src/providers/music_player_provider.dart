

import 'package:flutter/material.dart';

class MusicPlayerProvider extends ChangeNotifier{

  bool _play = false;


  //  getters

  bool get play => _play;


  set play(bool value){
    _play = value;
    notifyListeners();
  }
  


}