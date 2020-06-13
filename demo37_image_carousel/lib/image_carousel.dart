import 'dart:async';
import 'package:flutter/material.dart';

const _ZERO_INDEX = 0;
const _DEFAULT_BEGIN = 1;
const _DEFAULT_TIME = Duration(seconds: 1);
const _DEFAULT_SIZE = 10.0;
const _DEFAULT_RADIUS = 0.0;

class ImageCarousel extends StatefulWidget {
  final Duration transitionTime;
  final Duration stayTime;
  final List<String> urls;
  final bool reverse;
  final Axis scrollDirection;
  final Curve curve;
  final String placeholder;
  final bool showIndicator;
  final double indicatorSize;
  final Color indicatorSelectedColor;
  final Color indicatorUnselectedColor;
  final double indicatorRadius;
  final Curve fadeInCurve;
  final Duration fadeInDuration;
  final Curve fadeOutCurve;
  final Duration fadeOutDuration;
  final BoxFit fit;

  ImageCarousel({
    Key key,
    @required this.urls,
    @required this.placeholder,
    this.transitionTime = _DEFAULT_TIME,
    this.stayTime = _DEFAULT_TIME,
    this.reverse = false,
    this.scrollDirection = Axis.horizontal,
    this.curve = Curves.linearToEaseOut,
    this.showIndicator = true,
    this.indicatorSize = _DEFAULT_SIZE,
    this.indicatorSelectedColor = Colors.blueAccent,
    this.indicatorUnselectedColor = Colors.amberAccent,
    this.indicatorRadius = _DEFAULT_RADIUS,
    this.fadeInCurve = Curves.bounceIn,
    this.fadeInDuration = _DEFAULT_TIME,
    this.fadeOutCurve = Curves.bounceOut,
    this.fadeOutDuration = _DEFAULT_TIME,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int defaultEnd;
  PageController controller;
  Timer timer;
  int index;
  int indicator;

  @override
  void initState() {
    super.initState();
    index = _DEFAULT_BEGIN;
    indicator = _DEFAULT_BEGIN;
    defaultEnd = widget.urls.length;
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
        child: Stack(
          children: [
            PageView(
              scrollDirection: widget.scrollDirection,
              controller: controller,
              reverse: widget.reverse,
              physics: const BouncingScrollPhysics(),
              children: widgets,
              onPageChanged: (int currentPage) {
                index = currentPage;
                if (currentPage == _ZERO_INDEX) {
                  setState(() {
                    indicator = defaultEnd;
                  });
                } else if (currentPage == widgets.length - 1) {
                  setState(() {
                    indicator = _DEFAULT_BEGIN;
                  });
                } else {
                  setState(() {
                    indicator = currentPage;
                  });
                }
              },
            ),
            Positioned(
              child: Visibility(
                visible: widget.showIndicator,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(_DEFAULT_SIZE),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: generateIndicator(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateWidgets() {
    List<String> urls = [];
    String firstUrl = widget.urls.first;
    String lastUrl = widget.urls.last;

    urls.add(lastUrl);
    urls.addAll(widget.urls);
    urls.add(firstUrl);

    List<Widget> widgets = [];
    for (String url in urls) {
      widgets.add(FadeInImage(
        fit: widget.fit,
        fadeInCurve: widget.fadeInCurve,
        fadeOutCurve: widget.fadeOutCurve,
        fadeInDuration: widget.fadeInDuration,
        fadeOutDuration: widget.fadeOutDuration,
        placeholder: AssetImage(widget.placeholder),
        image: NetworkImage(url),
      ));
    }

    return widgets;
  }

  List<Widget> generateIndicator() {
    List<Widget> indicators = [];
    for (int i = 1; i <= widget.urls.length; i++) {
      Color color = i == indicator
          ? widget.indicatorSelectedColor
          : widget.indicatorUnselectedColor;
      indicators
          .add(_Indicator(widget.indicatorSize, widget.indicatorRadius, color));
    }

    return indicators;
  }

  void initTimer() {
    timer = Timer.periodic(widget.stayTime + widget.transitionTime, (t) {
      controller.animateToPage(++index,
          duration: widget.transitionTime, curve: widget.curve);
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    controller.dispose();
  }
}

class _Indicator extends StatelessWidget {
  final double size;
  final double radius;
  final Color color;

  const _Indicator(this.size, this.radius, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: EdgeInsets.only(right: _DEFAULT_SIZE),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: color,
      ),
    );
  }
}
