##flutter和原生交互

#### Flutter module引入

+ 创建flutter module

```
$ cd some/path/
$ flutter create -t module --org com.example my_flutter
```

+ app build_gradle配置

  + 支持java1.8

    ```
    android {
      //...
      compileOptions {
        sourceCompatibility 1.8
        targetCompatibility 1.8
      }
    }
    ```

  + module依赖

    ```
    dependencies {
      implementation project(':flutter')
    }
    ```

+ 工程build_gradle配置

  ```
  include ':app'                                     // assumed existing content
  setBinding(new Binding([gradle: this]))                                 // new
  evaluate(new File(                                                      // new
    settingsDir.parentFile,                                               // new
    'my_flutter/.android/include_flutter.groovy'                          // new
  ))                                                                      // new
  ```

**注明:**

Android原生的gradle版本和sdk版本需和flutter_module下的.android保持一致

#### 原生调Flutter

flutter代码:

```
void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  return MyApp();
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }

}
```

Android原生添加Flutter:

- FlutterView方式

```
            FlutterView flutterView = Flutter.createView(TestActivity.this, getLifecycle(),"route1");
            FrameLayout.LayoutParams layout = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
            addContentView(flutterView, layout);
```

- FlutterFragment方式

```
            FragmentTransaction tx = getSupportFragmentManager().beginTransaction();
            tx.replace(R.id.rootview, Flutter.createFragment("route1"));
            tx.commit();
```

**注明:**

FlutterView继承自SurfaceView,如果Debug模式加载flutterview页面有闪动正常,release模式好很多。

#### Flutter和原生的通信

Flutter和原生支持三种通信:

- BasicMessageChannel: 用于传递数据。Flutter与原生项目的资源是不共享的，可以通过BasicMessageChannel来获取Native项目的图标等资源。
- MethodChannel: 传递方法调用。Flutter主动调用Native的方法，并获取相应的返回值。比如获取系统电量，发起Toast等调用系统API，可以通过这个来完成。
- EventChannel: 传递事件。这里是Native将事件通知到Flutter。比如Flutter需要监听网络情况，这时候MethodChannel就无法胜任这个需求了。EventChannel可以将Flutter的一个监听交给Native，Native去做网络广播的监听，当收到广播后借助EventChannel调用Flutter注册的监听，完成对Flutter的事件通知。

Channel所支持的数据类型:

|            Dart            |       Android       |                      iOS                       |
| :------------------------: | :-----------------: | :--------------------------------------------: |
|            null            |        null         |            nil (NSNull when nested)            |
|            bool            |  java.lang.Boolean  |            NSNumber numberWithBool:            |
|            int             |  java.lang.Integer  |            NSNumber numberWithInt:             |
| int, if 32 bits not enough |   java.lang.Long    |            NSNumber numberWithLong:            |
|           double           |  java.lang.Double   |           NSNumber numberWithDouble:           |
|           String           |  java.lang.String   |                    NSString                    |
|         Uint8List          |       byte[]        |  FlutterStandardTypedData typedDataWithBytes:  |
|         Int32List          |        int[]        |  FlutterStandardTypedData typedDataWithInt32:  |
|         Int64List          |       long[]        |  FlutterStandardTypedData typedDataWithInt64:  |
|        Float64List         |      double[]       | FlutterStandardTypedData typedDataWithFloat64: |
|            List            | java.util.ArrayList |                    NSArray                     |
|            Map             |  java.util.HashMap  |                  NSDictionary                  |

以BasicMessageChannel为例:

android原生代码:

```
   basicMessageChannel = new BasicMessageChannel<String>(flutterView, "com.simple.channelflutterandroid/basic",
                StringCodec.INSTANCE);

        findViewById(R.id.button2).setOnClickListener(v -> {
//            basicMessageChannel.send("我是Native发送的消息");
            basicMessageChannel.send("我是Native发送的消息", new BasicMessageChannel.Reply() {
                @Override
                public void reply(Object o) {
                    Log.i("json","o: " + o);
                }
            });

        });

       basicMessageChannel.setMessageHandler((o, reply) -> Log.i("json","o= " + o));
```

Flutter端代码:

```
BasicMessageChannel _basicMessageChannel = BasicMessageChannel("com.simple.channelflutterandroid/basic", StringCodec());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    receiveMessage();
  }

  void receiveMessage() {
    _basicMessageChannel.setMessageHandler((str) async{
      print("It is Flutter -  receive str");

      setState(() {
        _text = str;
      });

    });
  }


  //发送消息给android
  Future<String> _sendMessage() async{
    String reply = await _basicMessageChannel.send("我是Flutter发送的消息");
    return reply;
  }
```

####Flutter module发布到maven 

+ 执行打包命令

```
flutter build apk
```

如果不涉及到第三方插件，直接集成生成的aar就ok。

如果涉及到第三方插件:

#### 参考文章

[https://github.com/flutter/flutter/wiki/Add-Flutter-to-existing-apps](https://github.com/flutter/flutter/wiki/Add-Flutter-to-existing-apps)

[Flutter与Android混合开发及Platform Channel的使用](https://www.jianshu.com/p/1317aed6cd8c)

[flutter打包aar上传maven集成到原生android工程](https://www.jianshu.com/p/2258760e9540)

#### 其他

[《Flutter实战》](https://book.flutterchina.club/chapter14/render_object.html)

[Flutter官方API](https://api.flutter.dev/flutter/painting/painting-library.html)

[pub.dev](https://pub.dev/packages?q=englishword)