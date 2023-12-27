// ignore_for_file: library_prefixes

import 'dart:math' as Math;
import 'dart:ui';
import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({
    super.key, 
    this.width, 
    this.height
  });

  final double? width;
  final double? height;

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  double percentage = 0.0;
  double newPercentage = 0.0;
  double oldPercentage = 0.0;

  @override
  void initState() {
    controller =  AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));

    controller.addListener(() {
      // print('controller value:${controller.value}');
      setState(() {
        percentage = lerpDouble(percentage, newPercentage, controller.value)!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
          padding: const EdgeInsets.all(5),
            width: 200,
            height: 200,
            // color: Colors.green,
            child: CustomPaint(
              painter: _MyRadialProgress(
                percentage: percentage,
                storkeWidth: 4,
                arcStrokeWidth: 5,
                arcColor: Colors.amber,
              ),
            ),
          ),
          Text('$percentage'),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith((_) => Colors.blue)
            ),
            onPressed: () {
              percentage =  newPercentage;
              newPercentage += 1;
              if(newPercentage > 100){
                newPercentage = 0.0;
                percentage = 0.0;
              }
              controller.forward(from: 0.0);
              setState((){});
            }, 
            child: const Text('Increase percentage')
          )
        ],
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  _MyRadialProgress({
    required this.percentage,
    this.storkeWidth,
    this.color,
    this.arcStrokeWidth,
    this.arcColor
  });

  final double percentage;
  final double? storkeWidth;
  final Color? color;
  final double? arcStrokeWidth;
  final Color? arcColor;


  @override
  void paint(Canvas canvas, Size size) {

    Rect rect = Rect.fromCircle(
      center:const  Offset(0, 0), 
      radius: 180,
    );
    Gradient gradient = const LinearGradient(colors: <Color>[
      Color.fromARGB(255, 68, 243, 255),
      Colors.pinkAccent,
      Colors.indigoAccent
    ]);

    final paint = Paint()
      ..strokeWidth= storkeWidth ?? 5
      ..color = color ?? Colors.black38
      ..style = PaintingStyle.stroke;

    final Offset position = Offset(size.width * 0.5, size.height / 2);
    final double radius = Math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(position, radius, paint);


    // arco

    final paintArco = Paint()
      ..strokeWidth= arcStrokeWidth ?? 10
      // ..color = arcColor ?? Colors.red
      ..shader  = gradient.createShader(rect)
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * Math.pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: position, radius: radius), 
      -Math.pi / 2, 
      arcAngle, 
      false, 
      paintArco
    );
  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}