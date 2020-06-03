import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  Carousel({Key key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController _controller;
  Timer _timer;
  int _currentPage;
  bool _manual;

  @override
  void initState() {
    super.initState();
    _manual = false;
    _currentPage = 1;
    _controller = PageController(initialPage: _currentPage);
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      print("定时器");
      _controller.animateToPage(_currentPage + 1, duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (downEvent) {
        _manual = true;
        print("down");
        if (_timer.isActive) {
          _timer.cancel();
        }
        if (_currentPage == 0) {
          Timer(Duration(milliseconds: 200), () {
            _currentPage = 3;
            _controller.jumpToPage(_currentPage);
          });
          return;
        }
        if (_currentPage == 4) {
          Timer(Duration(milliseconds: 200), () {
            _currentPage = 1;
            _controller.jumpToPage(_currentPage);
          });
          return;
        }
      },
      onPointerUp: (upEvent) {
        _manual = false;
        print("up");
        _timer = Timer.periodic(Duration(seconds: 2), (timer) {
          print("定时器");
          _controller.animateToPage(_currentPage + 1, duration: Duration(seconds: 1), curve: Curves.linearToEaseOut);
        });
      },
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: _controller,
        pageSnapping: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Container(
            color: Colors.amber,
          ),
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
          print("onChange");
          if (page == 0 && !_manual) {
            Timer(Duration(seconds: 1), () {
              _currentPage = 3;
              _controller.jumpToPage(_currentPage);
            });
            return;
          }
          if (page == 4 && !_manual) {
            Timer(Duration(seconds: 1), () {
              _currentPage = 1;
              _controller.jumpToPage(_currentPage);
            });
            return;
          }
          _currentPage = page;
          print("Current Page: " + page.toString());
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _controller.dispose();
  }
}
