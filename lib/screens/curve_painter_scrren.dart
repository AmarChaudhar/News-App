import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 242, 231, 178),
          Color.fromARGB(255, 235, 217, 159),
        ],
        stops: [0.3, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.22);
    path.quadraticBezierTo(size.width * 0.22, size.height * 0.26,
        size.width * 0.5, size.height * 0.22);
    path.quadraticBezierTo(
        size.width * 0.78, size.height * 0.18, size.width, size.height * 0.23);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Adding shadow to the path
    var shadowPaint = Paint()
      // ..color = Colors.black.withOpacity(0.20)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    print(shadowPaint);
    canvas.drawShadow(path, Colors.black, 4, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
