
import 'package:flutter/material.dart';

class SliderShowProvider extends ChangeNotifier{

  double _currentPage = 0;
  int _quantityOfPages = 0;


  // getters
  double get currentPage => _currentPage;
  int get quantityPages => _quantityOfPages;

  // setters

  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }
  set quantityPages(int value) {
    _quantityOfPages = value;
    notifyListeners();
  }

}