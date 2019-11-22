import 'package:flutter/material.dart';
import 'package:left_scroll_actions/left_scroll_actions.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: LeftScroll(
          buttonWidth: 0,
          child: Container(
            height: 60,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 1.0,
                style: BorderStyle.solid,
              ),
            ),
            child: Text('👈 Try Scroll Left'),
          ),
          buttons: <Widget>[
            LeftScrollItem(
              text: 'delete',
              color: Colors.red,
              onTap: () {
                print('delete');
              },
            ),
          ],
          onTap: () {
            print('tap row');
          },
        ),
      ),
    );
  }
}
