// ignore_for_file: must_be_immutable

import 'package:designs/src/models/sections.dart';
import 'package:flutter/material.dart';

class ExampleMask extends StatelessWidget {
  ExampleMask({
     super.key, 
     required this.widget,
     required this.name,
     required this.section
  });

  Widget widget;
  String name;
  Sections section;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pushReplacementNamed(context, 'selected-section', arguments: section), icon: const Icon(Icons.arrow_back)),
        title: Text(name),
      ),
      body: widget,
    );
  }
}