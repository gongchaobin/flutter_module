
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_flutter/HomePage.dart';
import 'package:my_flutter/HomePage2.dart';
import 'package:my_flutter/RouterPage.dart';
import 'package:my_flutter/TextWidget.dart';

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
      home: _widget(route),
      routes: {
        "new_page":(context) {
          print("RouterPage");
          return RouterPage(text: ModalRoute.of(context).settings.arguments,);
        }
      },
//      onGenerateRoute:(RouteSettings settings){
//        return MaterialPageRoute(builder: (context){
//          print("MaterialPageRoute");
//          String routeName = settings.name;
//          switch(routeName) {
//            case "new_page":
//            return RouterPage(text: ModalRoute.of(context).settings.arguments,);
//          }
//          return HomePage2(title: "路由跳转测试",);
//        }
//        );
//      },
    );
  }

  // ignore: missing_return
  Widget _widget(String route) {
    switch(route) {
      case "router1":
        return MyHomePage(title: 'Home Page',);
      case "router2":
        return HomePage(title: 'Home',);
      case "router3":
        return HomePage2(title: "路由跳转测试",);
      case "router4":
        return TextWidget();
    }
  }


}

