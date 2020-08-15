

import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  @override
  State<ButtonWidget> createState() {
    // TODO: implement createState
    return ButtonWidgetState();
  }
}

class ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ButtonWidget"
        ),
      ),
      body: Column(
        children: [
          RaisedButton( // 默认带阴影和灰色背景 按下阴影变大
            child: Text(
              "RaisedButton"
            ),
            onPressed: () {

            },
          ),
          FlatButton( // 默认背景透明不带阴影 按下有背景色
            child: Text(
              "FlatButton"
            ),
            onPressed: () {

            },
          ),
          OutlineButton( // 默认有一个边框,不带阴影且背景透明 按下边框颜色变亮,出现背景和阴影
            child: Text(
              "OutlineButton"
            ),
            onPressed: () {

            },
          ),
          IconButton( // 可点击的Icon,不包括文字,默认没有背景，点击出现背景
            icon: Icon(Icons.thumb_up),
            onPressed: () {

            },
          ),
          OutlineButton.icon(
            icon: Icon(Icons.add),
            label: Text("带图标的按钮"),
            onPressed: () {

            },
          ),
          FlatButton(
            child: Text(
              "自定义FlatButton",
              style: TextStyle(
                color: Colors.white
              ),
            ),
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            splashColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            onPressed: () {

            },
          ),
          RaisedButton(
            child: Text(
              "自定义RaisedButton",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            splashColor: Colors.grey,
            elevation: 0.0,
            highlightElevation: 0.0,
            disabledElevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            ),
            onPressed: () {

            },
          )
        ],
      ),
    );
  }

}