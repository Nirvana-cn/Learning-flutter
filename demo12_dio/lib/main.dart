import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:dio/dio.dart';
import 'starCharge.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dio'),
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
  String data = 'null';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 300,
              height: 200,
              child: WebView(
                initialUrl: "initialUrl",
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startRequest();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void startRequest() async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.get("http://app-resource.camsnetec.com/appVersionJsonTest.json");
      Version version = Version.fromJson(response.data);
      setState(() {
        data = version.androidStarcharge.appChangeLog;
      });
    } catch (e) {
      print(e);
    }
  }
}
