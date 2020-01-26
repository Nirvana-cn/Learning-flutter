import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cache Control'),
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
  String _cacheSizeStr = '0.0';

  ///加载缓存
  Future<Null> loadCache() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      double value = await _getTotalSizeOfFilesInDir(tempDir);
      tempDir.list(followLinks: false, recursive: true).listen((file) {
        //打印每个缓存文件的路径
        print(file.path);
      });
      print('临时目录大小: ' + value.toString());
      setState(() {
        _cacheSizeStr = _renderSize(value);
      });
    } catch (err) {
      print(err);
    }
  }

  /// 递归方式 计算文件的大小
  Future<double> _getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
    try {
      if (file is File) {
        int length = await file.length();
        return double.parse(length.toString());
      }
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        double total = 0;
        if (children != null)
          for (final FileSystemEntity child in children) total += await _getTotalSizeOfFilesInDir(child);
        return total;
      }
      return 0;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  ///格式化文件大小
  String _renderSize(double value) {
    if (null == value) {
      return '0';
    }
    List<String> unitArr = List()..add('B')..add('K')..add('M')..add('G');
    int index = 0;
    while (value > 1024) {
      index++;
      value = value / 1024;
    }
    String size = value.toStringAsFixed(2);
    return size + unitArr[index];
  }

  void _clearCache() async {
    //此处展示加载loading
    try {
      Directory tempDir = await getTemporaryDirectory();
      //删除缓存目录
      await delDir(tempDir);
      await loadCache();
    } catch (e) {
      print(e);
    } finally {
      //此处隐藏加载loading
    }
  }

  ///递归方式删除目录
  Future<Null> delDir(FileSystemEntity file) async {
    try {
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await delDir(child);
        }
      }
      await file.delete();
    } catch (e) {
      print(e);
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
            Text('缓存：$_cacheSizeStr'),
            OutlineButton(
              child: Text('下载图片 - 1'),
              onPressed: () async {
                var file = await DefaultCacheManager().downloadFile(
                    'https://user-gold-cdn.xitu.io/2019/12/26/16f409e706ab9fb9?imageView2/0/w/1280/h/960/format/webp/ignore-error/1');
                print(file.toString());
              },
            ),
            OutlineButton(
              child: Text('下载图片 - 2'),
              onPressed: () async {
                var file = await DefaultCacheManager()
                    .downloadFile('https://user-gold-cdn.xitu.io/2019/12/26/16f409e91d0ff121?imageslim');
                print(file.toString());
              },
            ),
            RaisedButton(
              child: Text('清除缓存 - 1'),
              onPressed: () {
                DefaultCacheManager().emptyCache();
              },
            ),
            RaisedButton(
              child: Text('清除缓存 - 2'),
              onPressed: () {
                _clearCache();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          loadCache();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
