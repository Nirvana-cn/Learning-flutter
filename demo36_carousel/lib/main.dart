import 'package:flutter/material.dart';

import 'carousel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Carousel'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          child: Carousel(
            children: [
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
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
