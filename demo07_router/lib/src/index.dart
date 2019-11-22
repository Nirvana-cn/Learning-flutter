import 'package:flutter/material.dart';

class Index extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Index Page"),
      ),
      body: Center(
        child: Text("This is ${args}"),
      ),
    );
  }
}