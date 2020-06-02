import 'dart:async';

import 'package:demo35linearprogress/linear_progress.dart';
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
      home: MyHomePage(title: 'LinearProgress'),
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

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (value == 100) {
        timer.cancel();
      } else {
        setState(() {
          value++;
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
            Container(
              child: LinearProgress(
                progress: value,
                lineWidth: 5,
                bgColor: Colors.grey,
                progressColor: Colors.blueAccent,
                gradientColors: [Colors.red, Colors.orange, Colors.yellow],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
