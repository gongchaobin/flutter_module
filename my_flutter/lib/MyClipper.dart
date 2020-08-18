

import 'package:flutter/cupertino.dart';

class MyClipper extends CustomClipper<Rect> {

  @override
  Rect getClip(Size size) {
    // TODO: implement getClip
    return Rect.fromLTRB(10.0, 15.0, 40.0, 30.0);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }

}