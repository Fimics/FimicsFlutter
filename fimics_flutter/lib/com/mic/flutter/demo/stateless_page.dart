
import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(color: Colors.red,fontSize: 22);
    return MaterialApp(
      title: 'TaoDou SDK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),),
        body: Container(
          //装饰器
          decoration: BoxDecoration(color: Colors.white),
          //局中方式
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              // Text("StatelessWidget与组件基础",style: TextStyle(color: Colors.red ,fontSize: 30),)
              Text("StatelessWidget与组件基础",style: style,),
              Icon(Icons.android,color: Colors.amber,size: 100,),
              CloseButton(),
              BackButton(),
              Chip(
                backgroundColor: Colors.yellow,
                  avatar: Icon(Icons.phone),
                  label: Text("小部件 小部件") ),
          Divider(
            height: 10,//容器高度，不是线的高度
            indent:  10, //左侧间距
            color: Colors.orange,
          ),

          Card(
            //带有圆角，阴影，边框效果的卡片
             color: Colors.blue,
             elevation: 5,
            margin: EdgeInsets.all(10),
            child: Container(
               padding:  EdgeInsets.all(10),
               child: Text('I am Card',style: style,),
            ),
          ),
             AlertDialog(
               title: Text('潘塔'),
               content: Text('你个老头子坏的很'),
             )
            ],
          ),
        ),
      ),

    );
  }
}
