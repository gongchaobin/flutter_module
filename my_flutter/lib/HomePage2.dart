

import 'package:flutter/material.dart';
import 'package:my_flutter/RouterPage.dart';

class HomePage2 extends StatefulWidget {

  HomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage2> {

  void _incrementCounter() async{
    var result = await Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return RouterPage(
          text: "我是新路由",
        );
      },maintainState: true
    ),);
    print("路由返回值: " + result);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
              fontSize: 16
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FlatButton(
          onPressed: _incrementCounter,
          child: Text(
            "路由跳转测试",
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add)),
    );
  }
}