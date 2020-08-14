

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

  void _incrementCounter() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return RouterPage();
    }));
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
        title: Text(widget.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add)),
    );
  }
}