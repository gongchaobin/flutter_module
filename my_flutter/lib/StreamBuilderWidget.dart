

import 'package:flutter/material.dart';

class StreamBuilderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StreamBuilderWidgetState();
  }

}

class StreamBuilderWidgetState extends State<StreamBuilderWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "StreamBuilder"
        ),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _counter(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if(snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream已关闭');
            }
            return null;
          },
        ),
      ),
    );
  }

  Stream<int> _counter() {
    return Stream.periodic(Duration(seconds: 1),(i) {
      return i;
    });
  }

}