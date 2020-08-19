

import 'package:flutter/material.dart';
import 'package:my_flutter/InfiniteListView.dart';

class ListView2Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "无限加载列表"
        )
      ),
//      body: InfiniteListView(),
      body: _headerListView(),
    );
  }

  Widget _headerListView() {
    return Column(
      children: [
        ListTile(
          title: Text(
            "商品列表"
          ),
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
            );
          },itemExtent: 50,itemCount: 100,),
        )
      ],
    );
  }


}