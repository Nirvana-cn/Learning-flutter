import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _DEFAULT_MIN = 0;
const double _DEFAULT_MAX = 100;
const double _DEFAULT_LINE_WIDTH = 10;

class LinearProgress extends StatelessWidget {
  final double min;
  final double max;
  final double progress;
  final Color bgColor;
  final Color progressColor;
  final List<Color> gradientColors;
  final double lineWidth;
  final Widget child;

  LinearProgress({
    @required this.progress,
    this.lineWidth = _DEFAULT_LINE_WIDTH,
    this.min = _DEFAULT_MIN,
    this.max = _DEFAULT_MAX,
    this.progressColor = Colors.blueAccent,
    this.bgColor = Colors.grey,
    this.gradientColors,
    this.child,
  })  : assert(min < max),
        assert(lineWidth > _DEFAULT_MIN);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: lineWidth,
      child: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(double.infinity, lineWidth),
            foregroundPainter: _FontPainter(computerPercent(), lineWidth, progressColor, gradientColors),
            painter: _BackPainter(lineWidth, bgColor),
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

class _BackPainter extends CustomPainter {
  final double width;
  final Color bgColor;

  _BackPainter(this.width, this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    Offset startPoint = Offset(0, size.height / 2);
    Offset endPoint = Offset(size.width, size.height / 2);

    final linePaint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    canvas.drawLine(startPoint, endPoint, linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is _BackPainter) {
      return oldDelegate.bgColor != bgColor ? true : false;
    }
    return false;
  }
}

class _FontPainter extends CustomPainter {
  final double percent;
  final double width;
  final Color progressColor;
  final List<Color> gradientColors;

  _FontPainter(this.percent, this.width, this.progressColor, this.gradientColors);

  @override
  void paint(Canvas canvas, Size size) {
    Offset startPoint = Offset(0, size.height / 2);
    Offset endPoint = Offset(size.width * percent, size.height / 2);

    final linePaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..strokeCap = StrokeCap.round;

    if (gradientColors != null) {
      final Gradient gradient = LinearGradient(
        colors: gradientColors,
      );
      linePaint.shader = gradient.createShader(Rect.fromLTWH(startPoint.dx, startPoint.dx, endPoint.dx, width));
    }

    canvas.drawLine(startPoint, endPoint, linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is _FontPainter) {
      return (oldDelegate.percent != percent ||
              oldDelegate.progressColor != progressColor ||
              oldDelegate.gradientColors != gradientColors)
          ? true
          : false;
    }
    return false;
  }
}
