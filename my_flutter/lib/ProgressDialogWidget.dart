
import 'package:flutter/material.dart';

class ProgressDialogWidget extends StatefulWidget {
  @override
  State<ProgressDialogWidget> createState() {
    // TODO: implement createState
    return ProgressDialogWidgetState();
  }

}

class ProgressDialogWidgetState extends State<ProgressDialogWidget> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {

      });
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "加载进度框"
        ),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: ColorTween(
              begin: Colors.grey,
              end: Colors.blue
            ).animate(_animationController),
            value: _animationController.value,
//            valueColor: AlwaysStoppedAnimation(Colors.blue),
//            value: .5,
          ),
          CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
          SizedBox(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            height: 100,
            width: 100,
          )
        ],
      ),
    );
  }

}