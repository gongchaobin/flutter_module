package com.example.flutter

import android.os.Bundle
import android.view.KeyEvent
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import timber.log.Timber

/**
 * Copyright (C)
 *
 * @author : gongcb
 * @date : 2020/8/14 3:36 PM
 * @desc :
 */
class FlutterViewActivity : AppCompatActivity() {

    private lateinit var flutterFragment: FlutterFragment

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_flutter_view)

        val router = intent.getStringExtra(MainActivity::class.java.simpleName)

        // 创建可缓存的FlutterEngine对象
        val flutterEngine = FlutterEngine(this)
        flutterEngine.navigationChannel.setInitialRoute(router)
        flutterEngine.dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())

        FlutterEngineCache.getInstance().put("my_engine_id",flutterEngine)
        flutterFragment = FlutterFragment.withCachedEngine("my_engine_id").build<FlutterFragment>()

        supportFragmentManager
            .beginTransaction()
            .add(R.id.container,flutterFragment)
            .commit()
    }

    override fun onBackPressed() {
        flutterFragment?.onBackPressed()
    }

}