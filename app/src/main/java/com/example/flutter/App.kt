package com.example.flutter

import android.app.Application
import com.blankj.utilcode.util.Utils
import timber.log.Timber

/**
 * Copyright (C)
 *
 * @author : gongcb
 * @date : 2020/8/14 3:24 PM
 * @desc :
 */
class App : Application() {

    override fun onCreate() {
        super.onCreate()

        Utils.init(this)
        Timber.plant(LogTree())

    }

}