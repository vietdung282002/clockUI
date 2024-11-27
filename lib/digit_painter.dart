import 'package:flutter/material.dart';

class DigitPainter extends CustomPainter {
  final String digit;
  DigitPainter(this.digit);

  @override
  void paint(Canvas canvas, Size size) {
    drawDigit(canvas, size, digit);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawDigit(Canvas canvas, Size size, String digit) {
    const List<List<int>> segmentData = [
      [1, 1, 1, 1, 1, 1, 0], //0
      [0, 0, 0, 0, 1, 1, 0], //1
      [1, 0, 1, 1, 0, 1, 1], //2
      [1, 0, 0, 1, 1, 1, 1], //3
      [0, 1, 0, 0, 1, 1, 1], //4
      [1, 1, 0, 1, 1, 0, 1], //5
      [1, 1, 1, 1, 1, 0, 1], //6
      [1, 0, 0, 0, 1, 1, 0], //7
      [1, 1, 1, 1, 1, 1, 1], //8
      [1, 1, 0, 1, 1, 1, 1], //9
    ];

    final List<int> segments = segmentData[int.parse(digit)];

    final double segmentThickness = size.height * 9 / 96;

    for (int i = 0; i < segments.length; i++) {
      Color color = Colors.white;
      if (segments[i] == 1) {
        color = Colors.black;
      }
      switch (i) {
        case 0:
          drawTopSegment(canvas, size, color, segmentThickness, 0);
        case 1:
          drawLeftSegment(canvas, size, color, segmentThickness, 2, 0);
        case 2:
          drawLeftSegment(
              canvas, size, color, segmentThickness, 2, size.height / 2);
        case 3:
          drawBottomSegment(canvas, size, color, segmentThickness, 0);
        case 4:
          drawRightSegment(
              canvas, size, color, segmentThickness, 2, size.height / 2);
        case 5:
          drawRightSegment(canvas, size, color, segmentThickness, 2, 0);
        case 6:
          drawMidSegment(canvas, size, color, segmentThickness, 2, 4);
      }
    }
  }

  void drawTopSegment(
      Canvas canvas, Size size, Color color, double thickness, double padding) {
    final x = size.width;
    final y = size.height;
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x - thickness, thickness)
      ..lineTo(thickness, thickness)
      ..close();
    canvas.drawPath(path, paint);
  }

  void drawBottomSegment(
      Canvas canvas, Size size, Color color, double thickness, double padding) {
    final x = size.width;
    final y = size.height;
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, y)
      ..lineTo(x, y)
      ..lineTo(x - thickness, y - thickness)
      ..lineTo(thickness, y - thickness)
      ..close();

    canvas.drawPath(path, paint);
  }

  void drawLeftSegment(Canvas canvas, Size size, Color color, double thickness,
      double padding, double margin) {
    final x = size.width;
    final y = size.height;
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, margin + padding)
      ..lineTo(0, margin + y / 2 - padding)
      ..lineTo(thickness, margin + y / 2 - padding - thickness)
      ..lineTo(thickness, margin + padding + thickness)
      ..close();

    canvas.drawPath(path, paint);
  }

  void drawRightSegment(Canvas canvas, Size size, Color color, double thickness,
      double padding, double margin) {
    final x = size.width;
    final y = size.height;
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(x, margin + padding)
      ..lineTo(x, margin + y / 2 - padding)
      ..lineTo(x - thickness, margin + y / 2 - padding - thickness)
      ..lineTo(x - thickness, margin + padding + thickness)
      ..close();

    canvas.drawPath(path, paint);
  }

  void drawMidSegment(Canvas canvas, Size size, Color color, double thickness,
      double padding, double margin) {
    final x = size.width;
    final y = size.height;
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(0, y / 2)
      ..lineTo(thickness, y / 2 - thickness + margin)
      ..lineTo(x - thickness, y / 2 - thickness + margin)
      ..lineTo(x, y / 2)
      ..lineTo(x - thickness, y / 2 + thickness - margin)
      ..lineTo(thickness, y / 2 + thickness - margin)
      ..close();
    canvas.drawPath(path, paint);
  }
}
