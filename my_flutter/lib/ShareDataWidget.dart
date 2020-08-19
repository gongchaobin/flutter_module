

import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {

  ShareDataWidget({this.data,Widget child}): super(child: child);

  final int data;

  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return oldWidget.data != data;
  }

}