
import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget{
  // @override‡
  // State<StatefulWidget> createState() {
  //        return _StatefullPageState();
  // }
  @override
  _StatefullPageState createState()=> _StatefullPageState();
}

class _StatefullPageState extends State<LayoutPage>{
  int _currentIndex=0;
  String url ="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202007%2F01%2F20200701063944_5VaBk.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&flutter=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1618805429&t=1b57c5a9e1b3239aafe89d0104e95137";
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(color: Colors.red,fontSize: 22);
    return MaterialApp(
      title: '加快速度 LayoutPage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Scaffold 是一个完整的页面
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout加快速度'),
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
                        Row(
                          children: <Widget>[
                            //圆形裁剪
                            ClipOval(
                              child: SizedBox(
                                width:  100,
                                height: 100,
                                child: Image.network(url),
                              ),
                            ),
                          Padding(padding: EdgeInsets.all(10),
                                 child: ClipRRect(
                                   //圆角
                                   borderRadius:BorderRadius.all(Radius.circular(20)),
                                   child: Opacity(
                                     opacity: 0.6,
                                      child: Image.network(url,width: 100,height: 100,),),
                                 ),),
                          ],
                        ),
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
                            url,
                            width: 200,
                            height: 200,),

                        Container(
                           height: 100,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Colors.lightBlueAccent),
                          child: PhysicalModel(color: Colors.transparent,
                            borderRadius: BorderRadius.circular(6),
                            clipBehavior: Clip.antiAlias,//抗锯齿
                            child: PageView(
                              children: <Widget>[
                                _page_item("page1", Colors.yellow),
                                _page_item("page1", Colors.black),
                                _page_item("page1", Colors.red),
                              ],
                            ),
                                 ),
                        ),

                        Column(
                          children: <Widget>[
                            //宽度撑满
                            FractionallySizedBox(
                              widthFactor: 1,
                              child:  Container(
                                decoration: BoxDecoration(color: Colors.deepOrange),
                                child: Text('宽度撑满'),
                              ),
                            )
                          ],
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
                  ),
                  //相对布局
                  Stack(
                    children: <Widget>[
                    Image.network(url,width: 100,height: 100,),
                     Positioned(
                       left: 0,
                       bottom: 0,
                       child: Image.network(url,width: 40,height: 40,),),
                    ],
                  ),
                  Wrap(
                    //创建一个warp 布局，从左到右进行排列，会自动换行
                    spacing: 8,//水平间距
                    runSpacing:6, //崔志间距,
                    children: <Widget>[
                      _chip('Flutter'),
                      _chip('kotlin'),
                      _chip('java---lppplll-script'),
                      _chip('c++'),
                      _chip('python'),
                      _chip('shouYe'),
                      _chip('page'),
                    ],
                  ),
                ],
              ),
            )
        :Column(
          children: <Widget>[
            Text('列表'),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color:Colors.red,
              ),
              child: Text('拉升填满高度'),
            ),)
          ],
        ),
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
      padding: EdgeInsets.only(left: 20,right: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title,style: TextStyle(fontSize: 22,color:  Colors.white),),
    );
  }

  _chip(String label){
    return Chip(
      label:  Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          label.substring(0,1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }

}