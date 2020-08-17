
import 'package:flutter/material.dart';

class LinearLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "线性布局"
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: [
              Text("Hello world",style: TextStyle(fontSize: 20),),
              Text("I am jack")
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                      "Hello world"
                  ),
                  Text(
                      "I am Jack"
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}