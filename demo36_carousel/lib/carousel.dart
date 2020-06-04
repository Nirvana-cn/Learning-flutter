import 'dart:async';
import 'package:flutter/material.dart';

const _ZERO_INDEX = 0;
const _DEFAULT_BEGIN = 1;
const _DEFAULT_TIME = Duration(seconds: 1);

class Carousel extends StatefulWidget {
  final Duration transitionTime;
  final Duration stayTime;
  final List<Widget> children;
  final bool reverse;
  final Axis scrollDirection;
  final Curve curve;

  Carousel({
    Key key,
    @required this.children,
    this.transitionTime = _DEFAULT_TIME,
    this.stayTime = _DEFAULT_TIME,
    this.reverse = false,
    this.scrollDirection = Axis.horizontal,
    this.curve = Curves.linearToEaseOut,
  }) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int defaultEnd;
  PageController controller;
  Timer timer;
  int index;

  @override
  void initState() {
    super.initState();
    index = _DEFAULT_BEGIN;
    defaultEnd = widget.children.length;
    controller = PageController(initialPage: index);

    initTimer();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = generateWidgets();

    return NotificationListener(
      onNotification: (notification) {
        switch (notification.runtimeType) {
          case ScrollEndNotification:
            if (index == _ZERO_INDEX) {
              index = defaultEnd;
              controller.jumpToPage(index);
            }
            if (index == widgets.length - 1) {
              index = _DEFAULT_BEGIN;
              controller.jumpToPage(index);
            }
            break;
        }
        return true;
      },
      child: Listener(
        onPointerDown: (downEvent) {
          if (timer.isActive) {
            timer.cancel();
          }
        },
        onPointerUp: (upEvent) {
          initTimer();
        },
        child: PageView(
          scrollDirection: widget.scrollDirection,
          controller: controller,
          reverse: widget.reverse,
          physics: const BouncingScrollPhysics(),
          children: widgets,
          onPageChanged: (int currentPage) {
            index = currentPage;
          },
        ),
      ),
    );
  }

  List<Widget> generateWidgets() {
    List<Widget> widgets = [];
    Widget firstElement = widget.children.first;
    Widget lastElement = widget.children.last;
    widgets.add(lastElement);
    widgets.addAll(widget.children);
    widgets.add(firstElement);

    return widgets;
  }

  void initTimer() {
    timer = Timer.periodic(widget.stayTime + widget.transitionTime, (t) {
      controller.animateToPage(++index, duration: widget.transitionTime, curve: widget.curve);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    controller.dispose();
  }
}
