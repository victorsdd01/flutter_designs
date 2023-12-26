// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ExampleMask extends StatelessWidget {
  ExampleMask({super.key, required this.widget});

  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget,
    );
  }
}