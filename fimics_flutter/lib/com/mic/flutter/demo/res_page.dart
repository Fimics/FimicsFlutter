import 'package:flutter/material.dart';

class ResPage extends StatefulWidget {
  @override
  _ResPageState createState() => _ResPageState();
}

class _ResPageState extends State<ResPage> {
  String clickStr = '';
  double mx = 0, my = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text('如何导入和使用Flutter的资源文件？'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  width: 100,
                  height: 100,
                  image: AssetImage('images/avatar.png'),
                )
              ],
            ),
          )),
    );
  }

  _printMsg(String s) {
    setState(() {
      clickStr = '， $s';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      mx += e.delta.dx;
      my += e.delta.dy;
    });
    print(e);
  }
}
