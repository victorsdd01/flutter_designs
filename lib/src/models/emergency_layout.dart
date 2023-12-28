


import 'package:flutter/material.dart';

class ListItem{

  List<Color> colors;
  String text;
  IconData icon;

  ListItem({
    required this.colors,
    required this.icon,
    required this.text
  });


  static List<ListItem> items = [
    ListItem(
      colors: <Color>[
        const Color(0xff6a88f5),
        const Color(0xffa58bf6),
      ], 
      icon: Icons.car_crash, 
      text: 'Motor accident',
    ),
    ListItem(
      colors: <Color>[
        const Color(0xff66a8f2),
        const Color(0xff546df5),
      ],
      icon: Icons.add, 
      text: 'Medical emergency',
    ),
    ListItem(
      colors: <Color>[
        const Color(0xfff1d472),
        const Color(0xffe784b3),
      ],
      icon: Icons.masks, 
      text: 'Theft/Herrasement',
    ),
    ListItem(
      colors: <Color>[
        const Color(0xff327283),
        const Color(0xff3a977a),
      ],
      icon: Icons.directions_bike_rounded,
      text: 'Awards',
    ),
  ];

  

}