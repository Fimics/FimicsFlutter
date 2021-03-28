
import 'package:flutter/material.dart';

class AnimationWidgetDemo extends StatefulWidget {
  @override
  _AnimationWidgetDemoState createState() => _AnimationWidgetDemoState();
}


class AnimatedLogo extends AnimatedWidget{

  AnimatedLogo({Key key,Animation<double> animation})
      :super(key:key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }


}

class _AnimationWidgetDemoState extends State<AnimationWidgetDemo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 20));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation,);
  }
}
