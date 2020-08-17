

import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "对齐与相对定位"
        )
      ),
      body: Column(
        children: [
          buildWidget(),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: Center(
              child: Text("xxxx"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: Center(
              heightFactor: 1.0,
              widthFactor: 1.0,
              child: Text("xxxx"),
            ),
          )
        ],
      )
    );
  }

  Widget buildWidget() {
    return Container(
      height: 120.0,
      width: 120.0,
      color: Colors.blue[50],
      child: Align(
//          alignment: Alignment.topRight,
        alignment: FractionalOffset(0.2, 0.6),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }


}