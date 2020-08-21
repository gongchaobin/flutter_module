

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DioWidgetState();
  }
}

class DioWidgetState extends State<DioWidget> {
  Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Dio"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: _dio.get("http://www.baidu.com"),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              Response response = snapshot.data;
              if(snapshot.hasError) {
                return Text(
                  snapshot.error.toString()
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

}
