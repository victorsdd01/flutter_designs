
import 'package:flutter/material.dart';

class SquareHeader extends StatelessWidget {
  const SquareHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}
class RoundedBordersHeader extends StatelessWidget {
  const RoundedBordersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color:  Color(0xff615AAB),
        borderRadius: BorderRadius.only(bottomLeft:  Radius.circular(50) ,bottomRight: Radius.circular(10) )
      ),
    );
  }
}
class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: DiagonalPainter(),
      ),
    );
  }
}
  class DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    // pencil props
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 50;
    final path = Path();

    // draw with the path and pencil

    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0,0);

    canvas.drawPath(path, pencil);

  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  }

  class TruanguleHeader extends StatelessWidget {
  const TruanguleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: TriangulePainter()
      ),
    );
  }
}

class TriangulePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pencil = Paint();
    pencil.color = const Color(0xff615AAB);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;
    final path = Path();

    // diagonal
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width,0);

    // pico
    // path.lineTo(0,size.height * 0.30);
    // path.lineTo(size.width * 0.5, size.height * 0.35);
    // path.lineTo(size.width , size.height * 0.30);
    // path.lineTo(size.width , 0);

    //curve
    // path.lineTo(0,size.height * 0.25);
    // path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    // path.lineTo(size.width, 0);

    //wave
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width * 0.5, size.height * 0.25);
    path.lineTo(size.width, 0);
    

    
    canvas.drawPath(path, pencil);
    


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}