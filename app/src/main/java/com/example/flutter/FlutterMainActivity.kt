package com.example.flutter

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.BasicMessageChannel
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

        private const val ChANNAL = "com.simple.channelled/basic"

        private const val ARG_ROUTE = "route"

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
        val basicMessChannel = BasicMessageChannel<String>(messenger, ChANNAL, StringCodec
            .INSTANCE)

        button.setOnClickListener {
            // 发送消息
            basicMessChannel.send("我是Native发送的消息") {
                Log.i(TAG,"it: $it")
            }
        }

        // 接收消息
        basicMessChannel.setMessageHandler { o, _ ->
            Log.i(TAG, "o= $o")
            button.text = o.toString()
        }

    }

}