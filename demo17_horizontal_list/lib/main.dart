import 'package:flutter/material.dart';

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
  List<String> list = ["自营", "免费停车"];

  Widget _buildItem(String string) {
    return Text(string);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: 300,
        height: 300,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("123"),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 300,
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: list.map(_buildItem).toList(),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text("123"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
