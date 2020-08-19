

import 'package:flutter/material.dart';

class ScrollViewWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    return Scaffold(
      appBar: AppBar(
        title: Text("ScrollView"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: str.split("").map((e) => 
                Text(e,textScaleFactor: 2.0,)
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }

}