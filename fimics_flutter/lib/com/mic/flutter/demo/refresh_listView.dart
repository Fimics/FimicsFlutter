
import 'package:flutter/material.dart';




class MyRefreshListViewApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyRefreshListViewApp> {

  void initState(){
    _scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        _loadData();
      }
    });
    super.initState();
  }
  List<String> cityNames=['北京', '上海', '广州','深圳', '杭州','苏州','成都', '武汉', '洛阳','厦门', '青岛','拉萨'];
  ScrollController _scrollController=ScrollController();


  Future<Null> _handleRefresh()async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames=cityNames.reversed.toList();
    });
  }

  _loadData() async{
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      List<String>list=List<String>.from(cityNames);
      list.addAll(cityNames);
      cityNames=list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('高级功能列表下拉刷新与上拉加载更多功能实现')),
            body: RefreshIndicator(
              onRefresh: _handleRefresh,
              child:  ListView(
                  controller: _scrollController,
                  children:_buildList()
              ),
            )
        ));
  }

  List<Widget> _buildList() {
    return cityNames.map((city)=>_item(city)).toList();
  }

  Widget _item(String city){
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color:Colors.green),
      child: Text(
        city,
        style: TextStyle(color:Colors.black54,fontSize: 20),
      ),
    );
  }

}


