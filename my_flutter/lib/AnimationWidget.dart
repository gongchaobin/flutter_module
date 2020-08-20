

import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnimationWidgetState();
  }
}

class AnimationWidgetState extends State<AnimationWidget> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController _animationController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: const Duration(seconds: 3));
    animation = CurvedAnimation(parent: _animationController, curve: Curves.bounceIn);
    animation = Tween(begin: 0.0,end: 300.0).animate(_animationController)..addListener(() {
      setState(() {

      });
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "动画"
        ),
      ),
      body: Center(
        child:  Image.asset(
          "images/ace_pic2_nor.png",
          width: animation.value,
          height: animation.value,
        ),
      ),
      );
  }

}