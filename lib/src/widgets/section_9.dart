

import 'package:flutter/material.dart';

class Xintro
 extends StatefulWidget {
  const Xintro
  ({super.key});

  @override
  State<Xintro> createState() => _XintroState();
}

class _XintroState extends State<Xintro> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;


  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _scaleAnimation =  Tween(begin: 1.0, end: 20.0).animate(
      CurvedAnimation(
        parent: _animationController, 
        curve: Curves.easeIn
      )
    );
    Future.delayed(Durations.extralong4).then((_) => _animationController.forward());
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) { 
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: child!
            );
           },
          child: const Icon(
            Icons.airplanemode_active_rounded, 
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}