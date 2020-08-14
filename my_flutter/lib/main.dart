
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _widget(route)
    );
  }

  // ignore: missing_return
  Widget _widget(String route) {
    switch(route) {
      case "router1":
        return MyHomePage(title: 'Home Page',);
      case "router2":
        return HomePage(title: 'Home',);
    }
  }


}

