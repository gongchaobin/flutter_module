

import 'package:flutter/material.dart';

class EditWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditWidgetState();
  }
}

class EditWidgetState extends State<EditWidget> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusScopeNode _focusScopeNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    _nameController.text = "hello world";
//    _nameController.selection = TextSelection(
//      baseOffset: 2,
//      extentOffset: _nameController.text.length
//    );

    _nameController.addListener(() {
      print("_nameController: " + _nameController.text);
    });

    _pwdController.addListener(() {

    });
    
    _focusNode1.addListener(() {
      print("_focusNode1: " + _focusNode1.hasFocus.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "编辑框"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24.0),
          child: Form(
            key: _formKey, // 设置GlobalKey 用于后面获取FormState
            autovalidate: true, // 开启自动校验
            child: buildTextField(),
        )
      )
    );
  }

  Widget buildTextField() {
    return Column(
      children: [
        TextFormField(
          autofocus: true,
          focusNode: _focusNode1,
          decoration: InputDecoration(
              labelText: "用户名",
              labelStyle: TextStyle(
                  color: Colors.blue
              ),
              hintText: "用户名或邮箱",
              prefixIcon: Icon(
                  Icons.person
              ),
              enabledBorder: UnderlineInputBorder( // 未获取焦点下划线的样式
                  borderSide: BorderSide(
                      color: Colors.grey
                  )
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue
                  )
              ),
          ),
          validator: (v) { // 校验用户名
            return v.trim().length > 0 ? null : "用户名不能为空";
          },
          controller: _nameController,
        ),
        TextFormField(
          focusNode: _focusNode2,
          decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(
                  Icons.lock
              )
          ),
          obscureText: true,
          controller: _pwdController,
          validator: (v) {
            return v.trim().length > 5 ? null : "密码不能少于6位";
          },
        ),
        RaisedButton(
          child: Text(
              "移动焦点"
          ),
          onPressed: () {
//            if(null == _focusScopeNode) {
//              _focusScopeNode = FocusScope.of(context);
//            }
//            _focusScopeNode.requestFocus(_focusNode2);
            if((_formKey.currentState as FormState).validate()) {

            }
          },
        ),
        RaisedButton(
          child: Text(
              "隐藏键盘"
          ),
          onPressed: () {
            _focusNode1.unfocus();
            _focusNode2.unfocus();
          },
        )
      ],
    );
  }



}