import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  static const platform = const MethodChannel('samples.flutter.io/battery');

  String _screenWidth = 'unknow';

  Future<Null> _getScreenWidth() async {
    String screenWidth;
    try {
      double result = await platform.invokeMethod('getScreenWidth');
      screenWidth = '${result.floor()}';
    } on PlatformException catch (e) {
      screenWidth = "unknow";
    }

    setState(() {
      _screenWidth = screenWidth;
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
            Text("The screen width is $_screenWidth"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getScreenWidth,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
