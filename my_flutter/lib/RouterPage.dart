

import 'package:flutter/material.dart';

class RouterPage extends StatelessWidget {

  RouterPage({Key key,this.text}): super();

  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      child:  Scaffold(
        appBar: AppBar(
          title: Text("$text"),
          automaticallyImplyLeading: true,
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () => Navigator.pop(context,"我是返回值"),
            child: Text(
              "返回"
            ),
          ),
        ),
      ),
    );


  }

}