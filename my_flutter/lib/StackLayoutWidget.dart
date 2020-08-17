

import 'package:flutter/material.dart';

class StackLayoutWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "层叠布局"
        ),
      ),
      body: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                Container(
                  child: Text(
                    "hello world",
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  ),
                ),
                Positioned(
                  left: 18.0,
                  child: Text(
                    "I am Jack"
                  ),
                ),
                Positioned(
                  top: 18.0,
                  child: Text(
                    "Your friend"
                  ),
                )
              ],
            ),
          )
    );
  }

}