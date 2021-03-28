
import 'package:flutter/material.dart';

const CITY_NAMES=['东城区','西城区','朝阳区','丰台区','石景山区','海淀区','顺义区'];



class MyGridViewApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyGridViewApp> {
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('网格布局')),
          body: GridView.count(
            crossAxisCount: 2,      //每行显示两列
            children:_buildList(),
          ),
        ));
  }

  List<Widget> _buildList() {
    return CITY_NAMES.map((city)=>_item(city)).toList();
  }

  Widget _item(String city){
    return Container(
      height: 80,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color:Colors.white,fontSize: 20),
      ),
    );
  }

}


