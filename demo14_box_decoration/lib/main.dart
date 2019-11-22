import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  _generateSimpleDialog(String string) {
    return SimpleDialog(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 50,
          child: Text(string),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('确认'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
      ],
    );
  }

  void _sendNetworkRequest(String string) {
    switch (string) {
      case "123456":
        Navigator.pop(context);
        Navigator.pushNamed(context, "user/charge");
        break;
      case "111111":
        showDialog(
          context: context,
          builder: (_) => _generateSimpleDialog("网络连接超时"),
        );
        break;
      default:
        _generateSimpleDialog("终端号不存在");
    }
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
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                    border: Border.all(
                      color: Color(0xFF00B3B9),
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(24.0),
                    ),
                  ),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(
                      horizontal: 150,
                      vertical: 37.5,
                    ),
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    child: Text(""),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {
                      _sendNetworkRequest("111111");
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 90,
                    vertical: 20,
                  ),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "请输入终端编号",
                      hintStyle: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(20),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
