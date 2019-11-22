import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
      home: MyHomePage(title: 'Flutter Home Page'),
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

  requestPermission() async {
    //请求权限
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.camera]);
    //校验权限
    if (permissions[PermissionGroup.camera] != PermissionStatus.granted) {
      showDialog(
        context: context,
        builder: (_) => _generateSimpleDialog("无照相权限"),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => _generateSimpleDialog("有照相权限"),
      );
    }
  }

  checkingPermission() async {
    //请求权限
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);

    //校验权限
    if (permission != PermissionStatus.granted) {
      requestPermission();
    } else {
      showDialog(
        context: context,
        builder: (_) => _generateSimpleDialog("有照相权限"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              PermissionHandler().openAppSettings().then((bool hasOpened) =>
                  debugPrint('App Settings opened: ' + hasOpened.toString()));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              child: Text(
                '点击查看相机权限',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              onTap: () {
                checkingPermission();
              },
            ),
          ],
        ),
      ),
    );
  }
}
