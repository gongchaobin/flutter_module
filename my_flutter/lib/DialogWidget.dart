

import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("对话框")
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text("对话框1"),
            onPressed: () async {
              bool delete = await showDeleteConfirmDialog1(context);
            }
          ),
          RaisedButton(
            child: Text("对话框2"),
            onPressed: () async{
              await changeLanguage(context);
            },
          ),
          RaisedButton(
            child: Text("对话框3"),
            onPressed: () {
            },
          ),
          RaisedButton(
            child: Text("对话框4"),
            onPressed: () {
            },
          )
        ], 
      ),
    );

  }

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1(BuildContext context) {
      return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示"),
            content: Text("您确定要删除当前文件吗?"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () => Navigator.of(context).pop(), // 关闭对话框
              ),
              FlatButton(
                child: Text("删除"),
                onPressed: () {
                  //关闭对话框并返回true
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        },
      );
    }

  Future<void> changeLanguage(BuildContext context) async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

}