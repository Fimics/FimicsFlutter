


import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String  clickStr='';
  double mx =0,my =0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('手势处理'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: ()=>_printMsg('单击'),
                    onDoubleTap: ()=>_printMsg('双击'),
                    onLongPress: ()=>_printMsg('长按'),
                    onTapCancel: ()=>_printMsg('取消'),
                    onTapUp: (e)=>_printMsg('抬起'),

                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Text(
                        'click me',
                        style: TextStyle(fontSize: 30,color: Colors.white),
                      ),

                    ),
                  ),
                  Text(clickStr),
                ],
              ),

              Positioned(
                //跟着手指滑动的小球
                left:  mx,
                top: my,
                child: GestureDetector(
                  onPanUpdate: (e) =>_doMove(e),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(36),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _printMsg(String s) {
    setState(() {
      clickStr ='， $s';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      mx+=e.delta.dx;
      my+=e.delta.dy;
    });
    print(e);
  }
}
