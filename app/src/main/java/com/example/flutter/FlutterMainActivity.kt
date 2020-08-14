package com.example.flutter

import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StringCodec
import kotlinx.android.synthetic.main.activity_test.*

/**
 * Copyright (C)
 *
 * @author : gongcb
 * @date : 2020/8/8 9:08 AM
 * @desc :
 */
class FlutterMainActivity : AppCompatActivity() {

    companion object {

        private val TAG = FlutterMainActivity::class.simpleName

        private const val BASIC_MESSAGE_ChANNAL = "com.simple.channelled/basic"

        private const val METHOD_MESSAGE_CHANNEL = "cn.wzh.whitter.plugins.flutter"

        private const val NATIVE_METHOD_LOGIN = "login"

        private const val EVENT_MESSAGE_CHANNEL = "com.example.evenhanded/inter"

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_test)

        // 默认初始路由"/"
//        val flutterFragment = FlutterFragment.createDefault()

        // 设置初始路由为route flutterEngine此时为null
//        val flutterFragment = FlutterFragment.withNewEngine()
//            .initialRoute("route1").build<FlutterFragment>()

        // 创建可缓存的FlutterEngine对象
        val flutterEngine = FlutterEngine(this)
        flutterEngine.navigationChannel.setInitialRoute("route1")
        flutterEngine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())

        FlutterEngineCache.getInstance().put("my_engine_id",flutterEngine)
        val flutterFragment = FlutterFragment.withCachedEngine("my_engine_id").build<FlutterFragment>()

        // 添加flutterFragment
        supportFragmentManager
            .beginTransaction()
            .add(R.id.container,flutterFragment)
            .commit()

        // BasicMessageChannel用来传递数据
        val messenger = flutterEngine.dartExecutor.binaryMessenger
        val basicMessChannel = BasicMessageChannel<String>(messenger, BASIC_MESSAGE_ChANNAL, StringCodec
            .INSTANCE)

        button.setOnClickListener {
            // 发送消息
            basicMessChannel.send("我是Native发送的消息") {
                Log.i(TAG,"it: $it")
            }
        }

        val methodChannel = MethodChannel(messenger, METHOD_MESSAGE_CHANNEL)
        button1.setOnClickListener {
            methodChannel.invokeMethod("callFlutter", "{'arg1':'来自Native'}", object : MethodChannel.Result {
                override fun notImplemented() {
                    Log.i(TAG,"notImplemented")
                }

                override fun error(p0: String?, p1: String?, p2: Any?) {
                    Log.i(TAG,"error")
                }

                override fun success(p0: Any?) {
                    Log.i(TAG,"success")
                }
            })
        }

        button2.setOnClickListener {
        }

        // 接收消息
        basicMessChannel.setMessageHandler { o, _ ->
            Log.i(TAG, "o= $o")
            button.text = o.toString()
        }

        methodChannel.setMethodCallHandler { call, result ->
            Log.i(TAG,"method: ${call.method}")
            when(call.method) {
                NATIVE_METHOD_LOGIN -> {
                    login()
                }
            }
        }

    }

    private fun login() {
        Toast.makeText(this,"MethodChannel被调用了",Toast.LENGTH_SHORT).show()
    }

}