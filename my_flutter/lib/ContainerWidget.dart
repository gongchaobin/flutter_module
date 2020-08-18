

import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Container容器"
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildContainer1(),
          _buildContainer2()
        ],
      )
    );
  }

  Widget _buildContainer1() {
    return  Container(
      margin: EdgeInsets.only(top: 50.0,left: 120.0),
      constraints: BoxConstraints.tightFor(width: 200.0,height: 150.0),
      decoration: BoxDecoration(
        color: Colors.blue
      ),
//      decoration: BoxDecoration(
//          gradient: RadialGradient(
//              colors: [Colors.red,Colors.orange],
//              center: Alignment.topRight,
//              radius: .98
//          ),
//          boxShadow: [
//            BoxShadow(
//                color: Colors.black54,
//                offset: Offset(2.0,2.0),
//                blurRadius: 4.0
//            )
//          ]
//      ),
//      transform: Matrix4.rotationZ(.2),
      alignment: Alignment.center,
      child: Text(
        "5.20",
        style: TextStyle(
            color: Colors.black,
            fontSize: 40.0
        ),
      ),
    );
  }

  Widget _buildContainer2() {
    return Container(
      margin: EdgeInsets.all(20.0),
      color: Colors.orange,
      child: Text("Hello world"),
    );
  }


}