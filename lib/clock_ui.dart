import 'dart:async';

import 'package:clock_ui/digit_painter.dart';
import 'package:clock_ui/dot_painter.dart';
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
    return DateFormat('mm:ss').format(DateTime.now());
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    List<String> digits = currentTime.replaceAll(":", "").split("");
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomPaint(
                size: const Size(70, 150),
                painter: DigitPainter(digits[0]),
              ),
              const SizedBox(
                width: 10,
              ),
              CustomPaint(
                size: const Size(70, 150),
                painter: DigitPainter(digits[1]),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPaint(
                    size: const Size(13, 13),
                    painter: DotPainter(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomPaint(
                    size: const Size(13, 13),
                    painter: DotPainter(),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              CustomPaint(
                size: const Size(70, 150),
                painter: DigitPainter(digits[2]),
              ),
              const SizedBox(
                width: 10,
              ),
              CustomPaint(
                size: const Size(70, 150),
                painter: DigitPainter(digits[3]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
