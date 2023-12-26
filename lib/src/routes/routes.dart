import 'package:designs/src/pages/pages.dart';
import 'package:flutter/material.dart';

class AppRoutes{

  static String initialRoute = "home";

  static Map<String, Widget Function(BuildContext)> routes = {
    "home":(_) => const HomePage(),
    "selected-section": (_) => const SelectedSection(),
  };
}