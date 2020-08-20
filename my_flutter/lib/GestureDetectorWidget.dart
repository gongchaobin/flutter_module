

import 'package:flutter/material.dart';

class GestureDetectorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GestureDetectorWidgetState();
  }

}

class GestureDetectorWidgetState extends State<GestureDetectorWidget> {

  String _operation = "No Gesture detected!";
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GestureDetector"
        ),
      ),
//      body: Center(
//        child: GestureDetector(
//          child: Container(
//            alignment: Alignment.center,
//            color: Colors.blue,
//            width: 200.0,
//            height: 200.0,
//            child: Text(
//              "$_operation",
//              style: TextStyle(
//                color: Colors.white
//              ),
//            ),
//          ),
//          onTap: () {
//            updateText("Tap");
//          },
//          onDoubleTap: () {
//            updateText("onDoubleTap");
//          },
//          onLongPress: () {
//            updateText("onLongPress");
//          },
//        ),
//      ),
      body: Stack(
        children: [
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text(
                  "A"
                ),
              ),
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e){
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
            ),
          )
        ],
      ),
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }

}