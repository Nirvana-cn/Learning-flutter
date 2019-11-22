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
      home: MyHomePage(title: 'Flutter Demo Ho11me Page'),
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
  String desc = "点我1123";
  double _left = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 50,
            left: _left,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    desc = "点我";
                  });
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left += details.delta.dx;
                    print(details.delta.dx.toString());
                  });
                },
                child: Text(
                  desc,
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
