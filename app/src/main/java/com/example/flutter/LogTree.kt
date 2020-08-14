package com.example.flutter

import android.util.Log
import timber.log.Timber

/**
 * Copyright (C)
 *
 * @author : gongcb
 * @date : 2019-08-28 18:50
 * @desc :
 */
class LogTree : Timber.DebugTree() {

    companion object {
        private val TAG = LogTree::class.simpleName
    }

    override fun log(priority: Int, tag: String?, message: String, t: Throwable?) {
        Log.i(TAG, "priority: $priority tag: $tag message: $message exception: ${t?.message}")
    }

    override fun isLoggable(priority: Int): Boolean {
        return BuildConfig.DEBUG
    }

}
