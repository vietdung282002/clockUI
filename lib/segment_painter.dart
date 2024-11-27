import 'dart:math';

import 'package:flutter/material.dart';

class OuterSegmentPainter extends CustomPainter {
  final Color color;
  OuterSegmentPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final x = size.width;
    final y = size.height;
    // TODO: implement paint
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.translate(x / 2, y / 2);

    canvas.rotate(pi / 2);

    canvas.translate(-x / 2, -y / 2);
    final path = Path()
      ..moveTo(y, 0)
      ..lineTo(x - y, 0)
      ..lineTo(x, y)
      ..lineTo(0, y)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class InnerSegmentPainter extends CustomPainter {
  final Color color;
  InnerSegmentPainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final x = size.width;
    final y = size.height;
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(0, y / 2)
      ..lineTo(y, 0)
      ..lineTo(x - y, 0)
      ..lineTo(x, y / 2)
      ..lineTo(x - y, y)
      ..lineTo(y, y)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
