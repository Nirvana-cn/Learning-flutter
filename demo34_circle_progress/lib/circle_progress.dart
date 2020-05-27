import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _DEFAULT_MIN = 0;
const double _DEFAULT_MAX = 100;
const double _DEFAULT_LINE_WIDTH = 10;
const double _DEFAULT_SIZE = 50;

class CircleProgress extends StatelessWidget {
  final double min;
  final double max;
  final double progress;
  final double size;
  final Color bgColor;
  final Color progressColor;
  final double lineWidth;
  final Widget child;

  CircleProgress({
    @required this.progress,
    this.lineWidth = _DEFAULT_LINE_WIDTH,
    this.min = _DEFAULT_MIN,
    this.max = _DEFAULT_MAX,
    this.size = _DEFAULT_SIZE,
    this.progressColor = Colors.blueAccent,
    this.bgColor = Colors.grey,
    this.child,
  })  : assert(min < max),
        assert(lineWidth > _DEFAULT_MIN);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(size, size), // 指定画布大小
            painter: MyPainter(computerPercent(), lineWidth, progressColor, bgColor),
          ),
          Align(
            alignment: Alignment.center,
            child: child,
          ),
        ],
      ),
    );
  }

  double computerPercent() {
    if (progress < min) return _DEFAULT_MIN;
    if (progress > max) return _DEFAULT_MAX;
    return (progress - min) / (max - min);
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final double width;
  final Color progressColor;
  final Color bgColor;

  MyPainter(this.percent, this.width, this.progressColor, this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    Offset circleCenter = Offset(size.width / 2, size.width / 2);
    double radius = size.width / 2;

    final paintCircle = Paint()
      ..color = bgColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    canvas.drawCircle(circleCenter, radius, paintCircle);

    final paintArc = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    canvas.drawArc(
      Rect.fromCircle(center: circleCenter, radius: radius),
      -pi / 2,
      percent * 2 * pi,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
