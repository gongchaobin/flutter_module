
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_flutter/AlignWidget.dart';
import 'package:my_flutter/AnimationWidget.dart';
import 'package:my_flutter/BoxWidget.dart';
import 'package:my_flutter/ButtonWidget.dart';
import 'package:my_flutter/CkButtonWidget.dart';
import 'package:my_flutter/ClipWidget.dart';
import 'package:my_flutter/ContainerWidget.dart';
import 'package:my_flutter/CustomScrollViewWidget.dart';
import 'package:my_flutter/DecoratedBoxWidget.dart';
import 'package:my_flutter/DialogWidget.dart';
import 'package:my_flutter/EditWidget.dart';
import 'package:my_flutter/FileWidget.dart';
import 'package:my_flutter/FlexLayoutWidget.dart';
import 'package:my_flutter/FlowLayoutWidget.dart';
import 'package:my_flutter/GestureDetectorWidget.dart';
import 'package:my_flutter/GestureRecognizerWidget.dart';
import 'package:my_flutter/GridViewWidget.dart';
import 'package:my_flutter/HomePage.dart';
import 'package:my_flutter/HomePage2.dart';
import 'package:my_flutter/ImageWidget.dart';
import 'package:my_flutter/LinearLayoutWidget.dart';
import 'package:my_flutter/ListView2Widget.dart';
import 'package:my_flutter/ListViewWidget.dart';
import 'package:my_flutter/PaddingWidget.dart';
import 'package:my_flutter/ProgressDialogWidget.dart';
import 'package:my_flutter/RouterPage.dart';
import 'package:my_flutter/ScaffoldWidget.dart';
import 'package:my_flutter/ScrollControllerWidget.dart';
import 'package:my_flutter/ScrollViewWidget.dart';
import 'package:my_flutter/ShareDataWidget.dart';
import 'package:my_flutter/StackLayoutWidget.dart';
import 'package:my_flutter/StreamBuilderWidget.dart';
import 'package:my_flutter/TextWidget.dart';
import 'package:my_flutter/ThemeDataWidget.dart';

import 'FutureBuilderWidget.dart';
import 'MyHomePage.dart';
import 'TransformWidget.dart';

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
      case "router5":
        return ButtonWidget();
      case "router6":
        return ImageWidget();
      case "router7":
        return CkButtonWidget();
      case "router8":
        return EditWidget();
      case "router9":
        return ProgressDialogWidget();
      case "router10":
        return LinearLayoutWidget();
      case "router11":
        return FlexLayoutWidget();
      case "router12":
        return FlowLayoutWidget();
      case "router13":
        return StackLayoutWidget();
      case "router14":
        return AlignWidget();
      case "router15":
        return PaddingWidget();
      case "router16":
        return BoxWidget();
      case "router17":
        return DecoratedBoxWidget();
      case "router18":
        return TransformWidget();
      case "router19":
        return ContainerWidget();
      case "router20":
        return ScaffoldWidget();
      case "router21":
        return ClipWidget();
      case "router22":
        return ScrollViewWidget();
      case "router23":
        return ListViewWidget();
      case "router24":
        return ListView2Widget();
      case "router25":
        return GridViewWidget();
      case "router26":
        return CustomScrollViewWidget();
      case "router27":
        return ScrollControllerWidget();
      case "router28":
        return ShareDataWidget();
      case "router29":
        return ThemeDataWidget();
      case "router30":
        return FutureBuilderWidget();
      case "router31":
        return StreamBuilderWidget();
      case "router32":
        return DialogWidget();
      case "router33":
        return GestureDetectorWidget();
      case "router34":
        return GestureRecognizerWidget();
      case "router35":
        return AnimationWidget();
      case "router36":
        return FileWidget();
    }

  }


}

