import 'package:flutter/material.dart';

class StockGraphPainter extends CustomPainter {
  final double animationValue;

  StockGraphPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width * 0.3, size.height / 2 - animationValue)
      ..lineTo(size.width * 0.6, size.height / 2 + animationValue)
      ..lineTo(size.width, size.height / 2 - animationValue);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
