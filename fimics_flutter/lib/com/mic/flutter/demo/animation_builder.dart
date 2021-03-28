
import 'package:flutter/material.dart';

class AnimationBuilderDemo extends StatefulWidget {
  @override
  _AnimationBuilderDemoState createState() => _AnimationBuilderDemoState();
}


class LogWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget{

  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context,child)=>Container(
          height: animation.value,
          width: animation.value,
          child: child,
        ),
        child: child,
    );
  }

}

class _AnimationBuilderDemoState extends State<AnimationBuilderDemo>
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
    return GrowTransition(animation: animation,child: LogWidget());
  }
}
