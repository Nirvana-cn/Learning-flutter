import 'package:flutter/material.dart';
import 'src/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  List<MockData> _list = data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: 500,
        child: ListView(
          children: _list.map(_buildItem).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(MockData element) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            child: new Image.asset(element.imageUrl),
            width: 30,
            height: 30,
            margin: const EdgeInsets.all(10.0),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(element.time),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: new Text(
                      element.totalFee.toString() + "元/度",
                      style: new TextStyle(
                          fontSize: 20, color: Color(0xFFFF8C00)),
                    ),
                  ),
                  new Text(
                      "电费：${element.eFee}元/度    服务费：${element.serviceFee}元/度"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
