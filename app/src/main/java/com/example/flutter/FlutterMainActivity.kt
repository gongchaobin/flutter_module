package com.example.flutter

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterFragment
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

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_test)

        val flutterFragment = FlutterFragment.createDefault()
        supportFragmentManager
            .beginTransaction()
            .add(R.id.container,flutterFragment)
            .commit()

        button.setOnClickListener {
            // BasicMessageChannel用来传递数据
            val messenger = flutterFragment.flutterEngine!!.dartExecutor!!.binaryMessenger
            val basicMessChannel = BasicMessageChannel<String>(messenger, ChANNAL, StringCodec
                .INSTANCE)
            basicMessChannel.send("我是Native发送的消息") {
                Log.i(TAG,"it: $it")
            }
        }
    }

}