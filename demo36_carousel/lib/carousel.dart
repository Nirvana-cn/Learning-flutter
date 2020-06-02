import 'dart:async';

import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  Carousel({Key key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController _controller;
  Timer _timer;
  int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
    _controller = PageController(initialPage: 0);
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if(_count == 2) {
        Timer(Duration(seconds: 1), (){
          _count = 0;
          _controller.jumpToPage(_count);
        });
      }
      _count++;
      _controller.animateToPage(_count, duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);

    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      controller: _controller,
      pageSnapping: true,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.redAccent,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.amber,
        ),
        Container(
          color: Colors.redAccent,
        ),
      ],
      onPageChanged: (int page) {

        print("Current Page: " + page.toString());
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _controller.dispose();
  }
}