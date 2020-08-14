

import 'package:flutter/material.dart';

class RouterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("新路由"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Text("This is a new router"),
      ),
    );
  }

}