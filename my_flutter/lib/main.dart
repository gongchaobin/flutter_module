
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_flutter/HomePage.dart';

import 'MyHomePage.dart';

void main() => runApp(__widgetFromRoute(window.defaultRouteName));

// ignore: missing_return
Widget __widgetFromRoute(String route) {
  print("route: " + route);
  return MyApp(route: route,);
}

class MyApp extends StatelessWidget {

  MyApp({Key key, this.route}) : super(key: key);

  final String route;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _widget(route)
    );
  }

  Widget _widget(String route) {
    switch(route) {
      case "route1":
        return MyHomePage(title: 'Home Page',);
      case "route2":
        return HomePage(title: '测试',);
    }
  }


}

