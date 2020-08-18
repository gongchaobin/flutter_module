

import 'package:flutter/material.dart';
import 'package:my_flutter/MyClipper.dart';

class ClipWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget avater = Image.asset("images/ace_pic2_nor.png",width: 60.0,);

    return Scaffold(
      appBar: AppBar(
        title: Text("Clip"),
      ),
      body: Center(
        child: Column(
          children: [
            avater,
            ClipOval(
              child: avater,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: avater,
                ),
                Text("你好世界", style: TextStyle(color: Colors.green),)
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5,
                    child: avater,
                  ),
                ),
                Text("你好世界",style: TextStyle(color: Colors.green),)
              ],
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: ClipRect(
                clipper: MyClipper(),
                child: avater,
              ),
            )
          ],
        ),
      ),
    );
  }

}