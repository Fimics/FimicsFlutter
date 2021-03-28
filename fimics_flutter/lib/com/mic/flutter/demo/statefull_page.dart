
import 'package:flutter/material.dart';

class StatefullPage extends StatefulWidget{
  // @override‡
  // State<StatefulWidget> createState() {
  //        return _StatefullPageState();
  // }
  @override
  _StatefullPageState createState()=> _StatefullPageState();
}

class _StatefullPageState extends State<StatefullPage>{
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(color: Colors.red,fontSize: 22);
    return MaterialApp(
      title: '加快速度',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Scaffold 是一个完整的页面
      home: Scaffold(
        appBar: AppBar(
          title: Text('加快速度 full'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex =index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home,color: Colors.grey,),
                activeIcon: Icon(Icons.home,color: Colors.blue,),
                title: Text('首页'),
            ),

          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.grey,),
              activeIcon: Icon(Icons.home,color: Colors.blue,),
              title: Text('列表'),
          ),

        ],),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex==0?
            RefreshIndicator(
              onRefresh: _refresh,
              child: ListView(
                children: <Widget>[
                  Container(
                    //装饰器
                    decoration: BoxDecoration(color: Colors.white),
                    //局中方式
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        // Text("StatelessWidget与组件基础",style: TextStyle(color: Colors.red ,fontSize: 30),)
                        Text("StatefulWidget与组件基础",style: style,),
                        Icon(Icons.android,color: Colors.amber,size: 10,),
                        TextField(
                          //输入文本的样式
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(0,0,0,0),
                            hintText: '请输入',
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                        Image.network(
                            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202007%2F01%2F20200701063944_5VaBk.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&flutter=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618805429&t=1b57c5a9e1b3239aafe89d0104e95137",
                            width: 200,
                            height: 200,),

                        Container(
                           height: 100,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(color: Colors.lightBlueAccent),
                          child: PageView(
                            children: <Widget>[
                              _page_item("page1", Colors.yellow),
                              _page_item("page1", Colors.black),
                              _page_item("page1", Colors.red),
                            ],
                          ),
                        ),
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
                  )
                ],
              ),
            )
        :Text('列表'),
      ),

    );
  }

  int count;
  Future<int> _refresh() async{
    await Future.delayed(Duration(microseconds: 5000));
    count++;
    print("count ->$count");
    return count;
  }

  _page_item(String title,Color color){
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title,style: TextStyle(fontSize: 22,color:  Colors.white),),
    );
  }

}