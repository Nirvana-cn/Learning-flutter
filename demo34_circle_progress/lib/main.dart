import 'dart:async';

import 'package:demo34circleprogress/circle_progress.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Circle Progress'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 10;
  double remain = 90;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (value == 100) {
        timer.cancel();
      } else {
        setState(() {
          value++;
          remain--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleProgress(
              progress: value,
              size: 100,
              lineWidth: 15,
              progressColor: Colors.greenAccent,
              bgColor: Colors.black26,
              child: Text("${value.toInt()}%"),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            CircleProgress(
              progress: remain,
              size: 100,
              lineWidth: 15,
              progressColor: Colors.blueAccent,
              child: Text("剩余${remain.toInt()}秒"),
            ),
          ],
        ),
      ),
    );
  }
}
