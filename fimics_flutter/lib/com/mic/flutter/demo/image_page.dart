import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  String url ="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202007%2F01%2F20200701063944_5VaBk.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&flutter=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618805429&t=1b57c5a9e1b3239aafe89d0104e95137";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'image loader',
      theme: new ThemeData.fallback(),
      home: Scaffold(
        body: Center(
          child: ListView(
            children: <Widget>[
              //加载网路图片
              Image.network(url,width: 100,height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
