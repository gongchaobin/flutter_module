


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "文本Widget",
          style: TextStyle(
            fontSize: 20
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Text(
        "我是TextWidget" * 4,
        style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          height: 1.2, // 用于指定行高 fontSize*height
//          fontFamily: "Courier",
        background: Paint()..color = Colors.yellow,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left, // 参照物是Text本身
//        textScaleFactor: 1.0,
      ),
//      body: Text.rich(TextSpan(
//        children: [
//          TextSpan(
//            text: "Home:"
//          ),
//          TextSpan(
//            text: "https://flutterchina.club",
//            style: TextStyle(
//              color: Colors.blue
//            ),
//            recognizer: TapGestureRecognizer()..onTap = () {
//              print("1111");
//            }
//          )
//        ]
//      )),
    );
  }

}