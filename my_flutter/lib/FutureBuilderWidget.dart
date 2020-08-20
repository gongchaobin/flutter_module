

import 'package:flutter/material.dart';

class FutureBuilderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FutureBuilderWidgetState();
  }

}

class FutureBuilderWidgetState extends State<FutureBuilderWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FutureBuilderWidget"
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: mockNetworkData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.connectionState == ConnectionState.done) {
              if(snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else {
                return Text("Contents: ${snapshot.data}");
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2),() {
      return "我是从互联网上获取的数据";
    });
  }

}