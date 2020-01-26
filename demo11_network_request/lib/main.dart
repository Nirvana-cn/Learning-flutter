import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'model.dart';
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
      home: MyHomePage(title: 'HTTP Request'),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startRequest();
        },
      ),
    );
  }

  void startRequest() async {
    HttpClient httpClient = new HttpClient();
//    Uri uri = Uri(
//      scheme: "https",
//      host: "app-cdn.starcharge.com",
//      path: "/appVersionJson.json"
//    );
//    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://app-cdn.starcharge.com/appVersionJson.json"));
    HttpClientResponse response = await request.close();
    String responseBody = await response.transform(utf8.decoder).join();
    Map dataMap = json.decode(responseBody);
    Version version = Version.fromJson(dataMap);
    setState(() {
      data = version.androidStarcharge.appChangeLog;
    });
    httpClient.close();
  }
}
