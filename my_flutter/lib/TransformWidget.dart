
import 'package:flutter/material.dart';

class TransformWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("变换"),
      ),
      body: Container(
        width: 100,
        height: 100,
        color: Colors.black,
        child: Transform(
          alignment: Alignment.topRight,
          transform: Matrix4.skewY(0.3),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.deepOrange,

          ),
        ),
      ),
    );
  }

}