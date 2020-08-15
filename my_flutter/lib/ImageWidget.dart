
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ImageWidget"
        ),
      ),
      body: Column(
        children: [
          Image(
            image: AssetImage("images/ace_pic2_nor.png",),
            width: 100,
            height: 100,
            alignment: Alignment.topLeft,
          ),
          _itemWidget(BoxFit.fill, "BoxFit.fill"),
          _itemWidget(BoxFit.contain, "BoxFit.contain"),
          _itemWidget(BoxFit.cover, "BoxFit.cover"),
          _itemWidget(BoxFit.fitWidth, "BoxFit.fitWidth"),
          _itemWidget(BoxFit.fitHeight, "BoxFit.fitHeight"),
          _itemWidget(BoxFit.scaleDown, "BoxFit.scaleDown"),
          _itemWidget(BoxFit.none, "BoxFit.none"),
          Row(
            children: [
              Icon(
                Icons.accessibility,
              ),
              Icon(
                Icons.error,
              ),
              Icon(
                Icons.fingerprint,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _itemWidget(BoxFit boxFit,String styleName) {
    return Row(
      children: [
        Image.network(
          "http://guolin.tech/book.png",
          width: 100,
          height: 80,
          fit: boxFit,
          // fill 拉伸填充满显示空间, 图片本身长宽比会发生变化 图片会变形
          // cover 图片长宽比放大居中填满显示空间 图片不会变形,超出显示空间会被裁剪
          // contain 图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形
          //
          color: Colors.blue,
          colorBlendMode: BlendMode.difference,
          repeat: ImageRepeat.repeatY,
        ),
        Text(
          styleName
        )
      ],
    );
  }


}