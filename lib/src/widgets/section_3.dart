
// ignore_for_file: unused_element, must_be_immutable

import 'package:flutter/material.dart';
import 'dart:math' as Math;

class Rectangle extends StatefulWidget {
  const Rectangle({super.key});

  @override
  State<Rectangle> createState() => _RectangleState();
}

class _RectangleState extends State<Rectangle> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> rotation;
  late Animation<double> opacity;
  late Animation<double> opacityOut;
  late Animation<double> moveToRight;
  late Animation<double> enlarge;

  @override
  void initState() {

    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000 ));

    rotation = Tween(begin: 0.0, end: 2 * Math.pi ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: const Interval(0, 0.25, curve: Curves.easeOut)));
    opacityOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));
    moveToRight = Tween( begin: 0.0, end: 200.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    enlarge = Tween( begin: 0.0, end: 2.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    // listener



    _animationController.addListener(() {
      print('status: ${_animationController.status}');
      if(_animationController.status == AnimationStatus.completed){
        _animationController.reverse();
      }
    });

    super.initState();
  }

  @override
  void dispose() {

    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _animationController.forward();
    
    return AnimatedBuilder(
      //child: ,
      animation: _animationController, 
      child: _Rectangle(
        color: Colors.green,
      ),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moveToRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Center(
              child: Opacity(
                opacity: opacity.value - opacityOut.value,
                child: Transform.scale(
                  scale: enlarge.value,
                  child: child
                ),
              )
            ),
          ),
        );
      }
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({super.key});

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> moveToRight;
  late Animation<double> moveToUp;
  late Animation<double> moveLeft;
  late Animation<double> moveDown;


  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4000));
    moveToRight =  Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0, 0.25, curve: Curves.bounceOut)));
    moveToUp = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.25, 0.50, curve: Curves.bounceOut)));
    moveLeft = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.50, 0.75, curve: Curves.bounceOut)));
    moveDown = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(parent: _controller, curve: const Interval(0.75, 1.0, curve: Curves.bounceOut)));



  _controller.forward();
  _controller.addListener(() {
    
  });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(moveToRight.value + moveLeft.value, moveToUp.value + moveDown.value),
          child: child,
        );
      },
      child: _Rectangle(
        color: Colors.red.shade300
      )
    );
  }
}


// basic widget
class _Rectangle extends StatelessWidget {
  _Rectangle({
    super.key,
    required this.color
  });

  Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: color,
      ),
    );
  }
}