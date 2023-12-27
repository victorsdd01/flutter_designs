import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  const RadialProgress({
    super.key, 
    required this.percentage
  });

  final double percentage;

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late double oldPercentage;

  @override
  void initState() {
    oldPercentage = widget.percentage;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);
    final difference = widget.percentage - oldPercentage;
    oldPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) { 
        return Container(
          color: Colors.amber,
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress(percentage: (widget.percentage - difference) + (difference + controller.value)),
          ),
        );
      },
    );
  }
}


class _MyRadialProgress extends CustomPainter {
  _MyRadialProgress({
    required this.percentage
  });

  final double percentage;

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
      ..strokeWidth= 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset position = Offset(size.width * 0.5, size.height / 2);
    final double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(position, radius, paint);


    // arco

    final paintArco = Paint()
      ..strokeWidth= 10
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: position, radius: radius), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArco
    );
  
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}