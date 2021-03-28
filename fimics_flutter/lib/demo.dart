
import 'package:fimics_flutter/com/mic/flutter/demo/animation_builder.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/animation_demo.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/animation_hero.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/animation_hero1.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/animation_widget.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/expansion_title.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/gridview_demo.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/http_demo.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/image_page.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/launch_page.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/app_lifecycle.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/layout_page.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/listview1.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/listview2.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/photo_page.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/refresh_listView.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/statefull_page.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/stateless_page.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/tab_drawer.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/tab_navigator.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/theme_page.dart';
import 'package:fimics_flutter/com/mic/flutter/demo/widget_lifecycle.dart';
import 'package:flutter/material.dart';

import 'com/mic/flutter/demo/tab_app_bar.dart';


void main() {
  // runApp(MyApp());
  //   runApp(StatelessPage());
  // runApp(StatefullPage());
  // runApp(LayoutPage());
  // runApp(GesturePage());
  // runApp(ResPage());
  // runApp(LaunchPage());
  // runApp(WidgetLifecycle());
  // runApp(AppLifecycle());
  // runApp(new ThemePage());
  //  runApp(PhotoPage());
  // runApp(ImagePage());
  // runApp(AnimationDemo());
  // runApp(AnimationWidgetDemo());
  //  runApp(AnimationBuilderDemo());
  // runApp(MaterialApp(home: HeroAnimation(),));
  // runApp(MaterialApp(home: RadialExpansionDemo(),));
  // runApp(TabbedAppBarSample());
  // runApp(MaterialApp(home: TabNavigator(),));
  // runApp(MyApp1());
  // runApp(HttpDemo());
  // runApp(Listview1());
  // runApp(Listview2());
  // runApp(ExpansionTitle());
  // runApp(MyGridViewApp());
  runApp(MyRefreshListViewApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '加快速度',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何创建和使用Flutter的路由与导航？'),
        ),
        body: RouteNavigator(),
      ),
      routes: <String,WidgetBuilder>{
        'less':(BuildContext context) =>StatelessPage(),
        'full':(BuildContext context) =>StatefullPage(),
        'layout':(BuildContext context) =>LayoutPage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {


  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {

   return Container(
     child: Column (

       children: <Widget>[
         SwitchListTile(
             title: Text('${byName?'':'不'}通过路由名跳转'),
             value: byName,
             onChanged: (value){
           setState(() {
                byName = value;
           });
     }),
         _item("Less",StatelessPage(),'less'),
         _item("Full",StatefullPage(),'full'),
         _item("Layout",LayoutPage(),'layout'),
       ],
     ),
   );
  }

  _item(String title, page , String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          if(byName){
            Navigator.pushNamed(context, routeName);
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
          }
        },
        child: Text(title),
      ),
    );
  }



}
