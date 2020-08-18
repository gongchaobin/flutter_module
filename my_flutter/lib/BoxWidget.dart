

import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "尺寸限制类容器"
        ),
      ),
      body: Column(
        children: [
          _buildConstrainedBox(),
          _buildSizeBox(),
          _buildAspectRatio(),
        ],
      )
    );
  }

  Widget _buildConstrainedBox() {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 50.0
      ),
      child: Container(
        height: 2.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.red
          ),
        ),
      ),
    );
  }

  Widget _buildSizeBox() {
    return SizedBox(
      width: 80,
      height: 80,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.red
        ),
      ),
    );
  }

  Widget _buildAspectRatio() {
    return AspectRatio(
      aspectRatio: 3,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.red
        ),
      ),
    );
  }

}