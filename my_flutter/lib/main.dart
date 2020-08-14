
import 'dart:ui';

import 'package:flutter/material.dart';

import 'MyHomePage.dart';

void main() => runApp(__widgetFromRoute(window.defaultRouteName));

// ignore: missing_return
Widget __widgetFromRoute(String route) {
  print("route: " + route);
  switch(route) {
    case 'route1': // 测试flutter和原生通信
      return MyApp();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

