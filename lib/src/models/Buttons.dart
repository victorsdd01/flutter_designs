


import 'package:flutter/material.dart';

class Buttons{

  int id;
  Widget icon;
  Color color;
  double iconSize;


  Buttons({
    required this.id,
    required this.icon,
    required this.color,
    required this.iconSize,
  });

  static List<Buttons> buttons = [
    Buttons(id: 0,icon: const Icon(Icons.home_filled), color: Colors.grey.shade600, iconSize: 25),
    Buttons(id: 1,icon: const Icon(Icons.search), color: Colors.grey.shade600, iconSize: 25),
    Buttons(id: 2,icon: const Icon(Icons.notifications), color: Colors.grey.shade600, iconSize: 25),
    Buttons(id: 3,icon: const CircleAvatar(radius: 12,backgroundImage: NetworkImage('https://a.storyblok.com/f/191576/1200x800/faa88c639f/round_profil_picture_before_.webp'),), color: Colors.grey.shade600, iconSize: 25),
  ];
}
