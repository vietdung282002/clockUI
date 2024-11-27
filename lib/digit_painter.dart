import 'dart:math';

import 'package:flutter/material.dart';

class DigitPainter extends CustomPainter {
  final String digit;
  DigitPainter(this.digit);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4.0;

    drawDigit(canvas, size, digit);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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

    final segmentWidth = size.width;
    final segmentHeight = size.height / 2 - 5;
    final List<int> segments = segmentData[int.parse(digit)];
    final double segmentThickness = size.height * 8 / 96;

    for (int i = 0; i < segments.length; i++) {
      Color color = Colors.white;
      if (segments[i] == 1) {
        color = Colors.black;
      }
      // switch (i) {
      //   case 0:
      //     drawTopSegment(
      //         canvas, size, color, segmentWidth, segmentThickness, 0);
      //   case 1:
      //     drawLeftSegment(
      //         canvas, size, color, segmentHeight, segmentThickness, 2, 0, 0);
      //   case 2:
      //     drawLeftSegment(canvas, size, color, segmentHeight, segmentThickness,
      //         5, 0, size.height / 2);
      //   case 3:
      //     drawBottomSegment(
      //         canvas, size, color, segmentWidth, segmentThickness, 0);
      //   case 4:
      //     drawRightSegment(
      //         canvas, size, color, segmentWidth, segmentThickness, 2, 0, 0);
      //   case 5:
      //     drawRightSegment(canvas, size, color, segmentWidth, segmentThickness,
      //         5, 0, size.height / 2);
      //   // case 6:
      //   //   drawMidsegment(
      //   //       canvas, size, color, segmentWidth, segmentThickness, 2);
      // }
    }
  }

  void drawRect(Canvas canvas, Size size, Color color) {
    final double segmentThickness = size.height * 8 / 96;
  }

  void drawTopSegment(Canvas canvas, Size size, Color color, double width,
      double height, double padding) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0 + size.width, 0)
      ..lineTo(0 + size.width - height, height)
      ..lineTo(0 + height, height)
      ..close();
    canvas.drawPath(path, paint);
  }

  void drawBottomSegment(Canvas canvas, Size size, Color color, double width,
      double height, double padding) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - height, size.height - height)
      ..lineTo(size.height, size.height - height)
      ..close();

    canvas.drawPath(path, paint);
  }

  void drawLeftSegment(Canvas canvas, Size size, Color color, double width,
      double height, double padding, double x, double y) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, padding + y)
      ..lineTo(0, y + size.height / 2 - padding)
      ..lineTo(height, y + size.height / 2 - padding - height)
      ..lineTo(height, height + padding + y)
      ..close();

    canvas.drawPath(path, paint);
  }

  void drawRightSegment(Canvas canvas, Size size, Color color, double width,
      double height, double padding, double x, double y) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width, padding + y)
      ..lineTo(size.width, size.height / 2 - padding + y)
      ..lineTo(size.width - height, y + size.height / 2 - padding - height)
      ..lineTo(size.width - height, height + padding + y)
      ..close();

    canvas.drawPath(path, paint);
  }

  void drawMidsegment(Canvas canvas, Size size, Color color, double width,
      double height, double padding) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo(2, size.height / 2)
      ..lineTo(height + padding, size.height / 2 - height)
      ..lineTo(width - height + padding, size.height / 2 - height / 2)
      ..lineTo(width + padding, size.height / 2)
      ..lineTo(width - height + padding, size.height / 2 + height / 2)
      ..lineTo(height + padding, size.height / 2 + height / 2)
      ..close();
    canvas.drawPath(path, paint);
  }
}
