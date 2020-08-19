

import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget divider1 = Divider(color: Colors.blue,);
    Widget divider2 = Divider(color: Colors.green);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "列表"
        ),
      ),
//      body: ListView(
//        shrinkWrap: true,
//        padding: const EdgeInsets.all(20.0),
//        children: [
//          Text("I\'m dedicating every day to you"),
//          Text("Domestic life was never quite my style"),
//          Text("Domestic life was never quite my style"),
//          Text("Domestic life was never quite my style"),
//          Text("Domestic life was never quite my style"),
//        ],
//      ),
//      body: ListView.builder(itemBuilder: (BuildContext context,int index) {
//        return ListTile(
//          title: Text("$index"),
//        );
//      },itemCount: 100,itemExtent: 50.0,
//      ),
        body: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("$index"),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? divider1 : divider2;
            },
            itemCount: 200,
        ),
    );
  }

}