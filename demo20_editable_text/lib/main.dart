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
  final _controller = TextEditingController();
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final text = _controller.text.toLowerCase();
      print(text);
    });
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      print(_focusNode.hasFocus.toString());
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
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
              child: EditableText(
                controller: _controller,
                focusNode: _focusNode,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 40,
                ),
                cursorColor: Colors.blue,
                backgroundCursorColor: Colors.yellow,
                autofocus: true,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the button is pressed,
        // give focus to the text field using myFocusNode.
        onPressed: () {
          if (_focusNode.hasFocus) {
            FocusScope.of(context).requestFocus(FocusNode());
          } else {
            FocusScope.of(context).requestFocus(_focusNode);
          }
        },
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.edit),
      ),
    );
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }
}
