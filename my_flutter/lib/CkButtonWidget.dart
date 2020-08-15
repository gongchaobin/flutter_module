

import 'package:flutter/material.dart';

class CkButtonWidget extends StatefulWidget {
  @override
  State<CkButtonWidget> createState() {
    // TODO: implement createState
    return CkButtonState();
  }

}

class CkButtonState extends State<CkButtonWidget> {

  bool _switchSelect = true;
  bool _checkBoxSelect = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "单选框和复选框"
        ),
      ),
      body: Column(
        children: [
          Switch(
            value: _switchSelect,
            onChanged: (value) {
              setState(() {
                _switchSelect = value;
              });
            },
          ),
          Checkbox(
            value: _checkBoxSelect,
            activeColor: Colors.red,
            onChanged: (value) {
              setState(() {
                _checkBoxSelect = value;
              });
            },
          )
        ],
      ),
    );
  }
  
}