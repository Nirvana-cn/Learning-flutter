import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'model.dart';

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
  var data = "";

  @override
  void initState() {
    super.initState();
    startRequest();
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
            Text(data),
            RaisedButton(
              child: Text("请求数据"),
              onPressed: startRequest,
            )
          ],
        ),
      ),
    );
  }

  void startRequest() async {
    HttpClient httpClient = new HttpClient();
    Uri uri = Uri(
      scheme: "http",
      host: "172.16.1.129",
      port: 3000,
    );
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    Map dataMap = json.decode(responseBody);
    var dataObject = Data.fromJson(dataMap);
    setState(() {
      data = "The name is ${dataObject.result[1].name}, and his age is ${dataObject.result[1].age}.";
    });
    httpClient.close();
  }
}
