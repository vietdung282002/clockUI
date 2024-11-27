import 'dart:async';

import 'package:clock_ui/digit_painter.dart';
import 'package:clock_ui/dot_painter.dart';
import 'package:clock_ui/segment_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockUi extends StatefulWidget {
  const ClockUi({super.key});

  @override
  State<ClockUi> createState() => _ClockUiState();
}

class _ClockUiState extends State<ClockUi> {
  late String currentTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    currentTime = _getCurrentTime();
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        currentTime = _getCurrentTime();
      });
    });
  }

  String _getCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaint(
                size: Size(70, 150), // Kích thước vùng vẽ
                painter: DigitPainter("8"), // Sử dụng CustomPainter
              ),
              SizedBox(
                width: 10,
              ),
              CustomPaint(
                size: Size(65, 150), // Kích thước vùng vẽ
                painter: MyCustomPainter(), // Sử dụng CustomPainter
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    size: Size(13, 13), // Kích thước vùng vẽ
                    painter: DotPainter(), // Sử dụng CustomPainter
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomPaint(
                    size: Size(13, 13), // Kích thước vùng vẽ
                    painter: DotPainter(), // Sử dụng CustomPainter
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              CustomPaint(
                size: Size(65, 150), // Kích thước vùng vẽ
                painter: MyCustomPainter(), // Sử dụng CustomPainter
              ),
              SizedBox(
                width: 10,
              ),
              CustomPaint(
                size: Size(65, 150), // Kích thước vùng vẽ
                painter: MyCustomPainter(), // Sử dụng CustomPainter
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    paint.color = Colors.red;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ClockPainter extends CustomPainter {
  final String time;

  ClockPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
