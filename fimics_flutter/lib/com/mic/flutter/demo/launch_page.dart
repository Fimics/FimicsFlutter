import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  String clickStr = '';
  double mx = 0, my = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text('如何打开第三方应用？'),
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
               RaisedButton(
                 onPressed: ()=>_launchURL(),
                 child: Text('打开浏览器'),
               ),
               RaisedButton(
                 onPressed: () => _openMap(),
                 child: Text('打开地图'),
               )

             ],
           ),
         ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://www.devio.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _openMap() async {
    // Android
    const url = 'geo:52.32,4.917'; //APP提供者提供的 schema
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      //iOS
      const url = 'http://maps.apple.com/?ll=52.32,4.917';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
