import 'dart:math';
import 'dart:ui';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef Handle(int position);

class CircleProgress extends StatefulWidget {
  CircleProgress();

  @override
  State<CircleProgress> createState() => _CircleProgressState();
}

class _CircleProgressState extends State<CircleProgress> {
  int value = 0;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (value == 100) {
        _timer.cancel();
      } else {
        setState(() {
          value = value + 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(100, 100), // 指定画布大小
            painter: MyPainter(value),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(" $value%"),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final int value;

  MyPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final paintCircle = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(Offset(50, 50), 50, paintCircle);

    final paintArc = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(50, 50), radius: 50),
      -pi / 2,
      value / 100 * 2 * pi,
      false,
      paintArc,
    );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
