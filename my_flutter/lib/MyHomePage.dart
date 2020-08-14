import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _text = "我是谁";

  BasicMessageChannel _basicMessageChannel = BasicMessageChannel("com.simple.channelled/basic", StringCodec());

  static const _platform = const MethodChannel("cn.wzh.whitter.plugins"
      ".flutter");

  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  _sendMessage();

    _platform.invokeMethod(
        'login', {'message': '111'});

  }

  // 发送消息
  Future<String> _sendMessage() async {
    String reply = await _basicMessageChannel.send("我是Flutter发送的消息");
    return reply;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    receiveMessage();

    _platform.setMethodCallHandler(platformCallHandler);

  }

  // 接受消息
  Future<dynamic> platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case "callFlutter":
        print("arguments: " + call.arguments);
        return call.arguments;
        break;
    }
  }


  // 接收消息
  void receiveMessage() {
    _basicMessageChannel.setMessageHandler((str) async{
      print("It is Flutter -  receive str: " + str);
      setState(() {
        _text = str;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_text',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

