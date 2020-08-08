package com.example.flutter

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import io.flutter.embedding.android.FlutterFragment

/**
 * Copyright (C)
 *
 * @author : gongcb
 * @date : 2020/8/8 9:08 AM
 * @desc :
 */
class FlutterMainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_test)

        val flutterFragment = FlutterFragment.createDefault()
        supportFragmentManager
            .beginTransaction()
            .add(R.id.container,flutterFragment)
            .commit()

    }

}