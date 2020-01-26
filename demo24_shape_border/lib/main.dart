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
      home: MyHomePage(title: 'ShapeBorder'),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 50,
                minHeight: 50
              ),
              child: FlatButton(
                onPressed: () {},
                color: Colors.blueAccent,
                colorBrightness: Brightness.dark,
                child: Text("Button"),
                shape: CircleBorder(
                  side: BorderSide(color: Colors.grey)
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              color: Colors.amber,
              colorBrightness: Brightness.dark,
              child: Text("Button"),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            FlatButton(
              onPressed: () {},
              color: Colors.greenAccent,
              colorBrightness: Brightness.dark,
              child: Text("Button"),
              shape: ContinuousRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            FlatButton(
              onPressed: () {},
              color: Colors.redAccent,
              colorBrightness: Brightness.dark,
              child: Text("Button"),
              shape: BeveledRectangleBorder(
                side: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(30, 30))),
      ),
    );
  }
}

