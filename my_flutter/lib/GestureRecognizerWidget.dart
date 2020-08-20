

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GestureRecognizerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GestureRecognizerWidgetState();
  }

}

class GestureRecognizerWidgetState extends State<GestureRecognizerWidget> {

  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tapGestureRecognizer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GestureRecognizer"),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "您好世界"),
              TextSpan(
                text: "点我变色",
                style: TextStyle(
                  fontSize: 30.0,
                  color: _toggle? Colors.blue : Colors.red
                ),
                recognizer: _tapGestureRecognizer..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                }
              ),
              TextSpan(
                text: "你好世界"
              )
            ]
          )
        ),
      ),
    );
  }

}