import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as Math;

typedef Handle(int position);

class Rating extends StatefulWidget {
  final int count;
  final double size;
  final Color selectedColor;
  final Color unselectedColor;
  final Handle callbackHandle;

  Rating({
    this.count = 5,
    this.size = 40,
    this.selectedColor = Colors.amberAccent,
    this.unselectedColor = Colors.grey,
    this.callbackHandle,
  });

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: generateStars(),
    );
  }

  List<Widget> generateStars() {
    List<Widget> widgets = [];
    for (int i = 1; i <= widget.count; i++) {
      Color targetColor = i <= position ? widget.selectedColor : widget.unselectedColor;
      widgets.add(
        GestureDetector(
          onTap: () {
            setState(() {
              position = i;
            });
            if (widget.callbackHandle != null) {
              widget.callbackHandle(position);
            }
          },
          child: Star(widget.size, targetColor),
        ),
      );
    }

    return widgets;
  }
}

class Star extends StatelessWidget {
  final double size;
  final Color color;

  Star(this.size, this.color);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size), // 指定画布大小
      painter: MyPainter(color),
    );
  }
}

class MyPainter extends CustomPainter {
  final Color color;

  MyPainter(this.color);

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (Math.pi * degree / 180);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    double radius = size.width / 2;
    Path path = new Path();
    double radian = degree2Radian(36); // 36为五角星的角度
    double radius_in = (radius * Math.sin(radian / 2) / Math.cos(radian)); // 中间五边形的半径

    path.moveTo((radius * Math.cos(radian / 2)), 0.0); // 此点为多边形的起点
    path.lineTo(
        (radius * Math.cos(radian / 2) + radius_in * Math.sin(radian)), (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) * 2), (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) + radius_in * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) + radius * Math.sin(radian)), (radius + radius * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2)), (radius + radius_in));
    path.lineTo((radius * Math.cos(radian / 2) - radius * Math.sin(radian)), (radius + radius * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2) - radius_in * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * Math.sin(radian / 2)));
    path.lineTo(
        (radius * Math.cos(radian / 2) - radius_in * Math.sin(radian)), (radius - radius * Math.sin(radian / 2)));

    path.close();

    canvas.drawPath(path, paint);
  }

  // 正确利用此回调可以避免重绘开销
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is MyPainter) {
      return color == oldDelegate.color ? false : true;
    } else {
      return true;
    }
  }
}
